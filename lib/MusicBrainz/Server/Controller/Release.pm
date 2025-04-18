package MusicBrainz::Server::Controller::Release;
use Moose;
use MooseX::MethodAttributes;

use MusicBrainz::Server::Constants qw(
    :edit_type
    $EDITOR_MODBOT
    $MAX_INITIAL_MEDIUMS
    $MAX_INITIAL_TRACKS
);
use MusicBrainz::Server::Track;
use aliased 'MusicBrainz::Server::Entity::Recording';

extends 'MusicBrainz::Server::Controller';

with 'MusicBrainz::Server::Controller::Role::Load' => {
    entity_name     => 'release',
    model           => 'Release',
    relationships   => { all => ['show'], cardinal => ['edit_relationships'], default => ['url'] },
};
with 'MusicBrainz::Server::Controller::Role::LoadWithRowID';
with 'MusicBrainz::Server::Controller::Role::Alias';
with 'MusicBrainz::Server::Controller::Role::Annotation';
with 'MusicBrainz::Server::Controller::Role::Art' => {
    art_archive_name => 'cover',
    art_archive_model_name => 'CoverArtArchive',
    add_art_edit_type => $EDIT_RELEASE_ADD_COVER_ART,
    edit_art_edit_type => $EDIT_RELEASE_EDIT_COVER_ART,
    remove_art_edit_type => $EDIT_RELEASE_REMOVE_COVER_ART,
    reorder_art_edit_type => $EDIT_RELEASE_REORDER_COVER_ART,
};
with 'MusicBrainz::Server::Controller::Role::Details';
with 'MusicBrainz::Server::Controller::Role::EditListing';
with 'MusicBrainz::Server::Controller::Role::Tag';
with 'MusicBrainz::Server::Controller::Role::JSONLD' => {
    endpoints => {
        show => {copy_stash => ['release_artwork', 'top_tags', 'genre_map']},
        aliases => {copy_stash => ['aliases']},
        cover_art => {copy_stash => ['cover_art']},
    },
};
with 'MusicBrainz::Server::Controller::Role::Collection' => {
    entity_type => 'release',
};

use List::AllUtils qw( first nsort_by uniq );
use MusicBrainz::Server::Translation qw( l N_l );
use MusicBrainz::Server::Validation qw(
    is_integer
    is_positive_integer
);
use MusicBrainz::Server::Entity::Util::JSON qw( to_json_array to_json_object );
use POSIX qw( ceil );
use MusicBrainz::Server::Data::Utils qw(
    artist_credit_to_ref
    boolean_to_json
    localized_note
    partial_date_to_hash
);

=head1 NAME

MusicBrainz::Server::Controller::Release - Catalyst Controller for
working with Release entities

=head1 DESCRIPTION

This controller handles user interaction, both read and write, with
L<MusicBrainz::Server::Entity::Release> objects. This includes displaying
releases, editing releases and creating new releases.

=head1 METHODS

=head2 base

Base action to specify that all actions live in the C<label>
namespace

=cut

sub base : Chained('/') PathPart('release') CaptureArgs(0) { }

after 'load' => sub {
    my ($self, $c) = @_;

    my $release = $c->stash->{release};
    my $returning_jsonld = $self->should_return_jsonld($c);

    # Load release group
    $c->model('ReleaseGroup')->load($release);
    $c->model('ReleaseGroupType')->load($release->release_group);

    unless ($returning_jsonld) {
        $c->model('Release')->load_aliases($release);
        $c->model('Release')->load_meta($release);
        $c->model('ReleaseGroup')->load_meta($release->release_group);
        $c->model('Relationship')->load($release->release_group);
        $c->model('ArtistType')->load(map { $_->target } @{ $release->relationships_by_type('artist') }, @{ $release->release_group->relationships_by_type('artist') });
        if ($c->user_exists) {
            $c->model('ReleaseGroup')->rating->load_user_ratings($c->user->id, $release->release_group);
        }
    }

    if ($release->may_have_cover_art) {
        my $artwork = $c->model('CoverArt')->find_front_cover_by_release($release);
        $c->stash->{release_artwork} = $artwork->[0];

        my $artwork_count = $c->model('CoverArt')->find_count_by_release($release->id);
        $c->stash->{release_artwork_count} = $artwork_count;
    }

    my $cdtoc_count = $c->model('MediumCDTOC')->find_count_by_release($release->id);
    $c->stash->{release_cdtoc_count} = $cdtoc_count;

    $c->model('ArtistCredit')->load($release, $release->release_group);
    $c->model('ReleasePackaging')->load($release);
    $c->model('ReleaseStatus')->load($release);
    $c->model('Language')->load($release);
    $c->model('Script')->load($release);
    $c->model('Release')->load_related_info($release);

    if ($c->action->name ne 'edit') {
        # Only needed by pages showing the sidebar
        $c->model('CritiqueBrainz')->load_display_reviews($release->release_group)
            unless $returning_jsonld;
    }
};

# Stuff that has the side bar and thus needs to display collection information
after [qw( show collections details tags aliases
           discids cover_art add_cover_art edit_cover_art reorder_cover_art )] => sub {
    my ($self, $c) = @_;
    $self->_stash_collections($c);
};

sub discids : Chained('load') {
    my ($self, $c) = @_;

    my $release = $c->stash->{release};
    my @medium_cdtocs = $c->model('MediumCDTOC')->load_for_mediums($release->all_mediums);
    $c->model('CDTOC')->load(@medium_cdtocs);
    $c->model('Medium')->load(@medium_cdtocs);
    $c->model('Medium')->load_track_durations(map { $_->medium } @medium_cdtocs);
    my $has_cdtocs = scalar(@medium_cdtocs) > 0;

    my %props = (
        hasCDTocs => boolean_to_json($has_cdtocs),
        mediumCDTocs => to_json_array(\@medium_cdtocs),
        release => $release->TO_JSON,
    );

    $c->stash(
        component_path => 'release/DiscIds',
        component_props => \%props,
        current_view => 'Node',
    );
}

sub _load_mediums_limited {
    my ($self, $c, $mediums, $paged_medium, $medium_page_number) = @_;

    my @mediums = @{$mediums};
    my $user_id;

    if ($c->user_exists) {
        $user_id = $c->user->id;
    }

    if (@mediums && !defined $paged_medium) {
        my $medium_counter = 0;
        my $track_counter = 0;
        my @preloaded_mediums;

        for my $medium (@mediums) {
            $medium_counter += 1;
            last if $medium_counter > $MAX_INITIAL_MEDIUMS;
            $track_counter += $medium->track_count;
            last if $track_counter > $MAX_INITIAL_TRACKS;
            push @preloaded_mediums, $medium;
        }

        if (@preloaded_mediums) {
            $c->model('Medium')->load_related_info($user_id, @preloaded_mediums);
        } else {
            # If even the first medium exceeds $MAX_INITIAL_TRACKS, page that
            # instead of loading nothing. This is equivalent to navigating to
            # the /disc/1 subpath, except $no_script will remain 0.
            $paged_medium = $mediums[0];
        }
    }

    if ($paged_medium) {
        $c->model('Medium')->load_related_info_paged(
            $user_id,
            $paged_medium,
            $medium_page_number,
        );
    }
}

=head2 show

Display a release to the user.

This loads a release from the database (given a valid MBID or database row
ID) and displays it in full, including a summary of advanced relations,
tags, tracklisting, release events, etc.

=cut

sub show : Chained('load') PathPart('') {
    my ($self, $c, @args) = @_;

    my $release = $c->stash->{release};
    my @mediums = $release->all_mediums;
    my $paged_medium;
    my $medium_page_number = 1;
    my $no_script = 0;

    # Individual medium selected via /disc/n.
    #
    # This subpath is only linked where JavaScript is disabled, so
    # $no_script is set to 1 if we hit it.
    if (@args && $args[0] eq 'disc') {
        my $position = scalar(@args) > 1 ? $args[1] : undef;

        if (defined $position) {
            $c->detach('/error_400') unless is_positive_integer($position);

            $paged_medium = first { $_->position == $position } @mediums;

            if ($paged_medium) {
                $no_script = 1;

                my $page = $c->req->query_params->{page};
                if (defined $page) {
                    $c->detach('/error_400') unless is_integer($page);

                    my $max_page = ceil($paged_medium->track_count / $MAX_INITIAL_TRACKS);
                    if ($page > $max_page) {
                        $c->detach('/error_404');
                    }
                    $medium_page_number = $page;
                }
            } else {
                $c->detach('/error_404');
            }
        }
    }

    $self->_load_mediums_limited($c, \@mediums, $paged_medium, $medium_page_number);

    my $bottom_credits = $c->req->cookies->{'bottom-credits'};
    my $credits_mode = defined $bottom_credits &&
        $bottom_credits->value eq '1' ? 'bottom' : 'inline';

    my %props = (
        creditsMode => $credits_mode,
        release => $release->TO_JSON,
        noScript => boolean_to_json($no_script),
        numberOfRevisions => $c->stash->{number_of_revisions},
    );

    $c->stash(
        component_path => 'release/ReleaseIndex',
        component_props => \%props,
        current_view => 'Node',
    );
}

sub _load_related : Private {
    my ($self, $c) = @_;

    my $release = $self->entity;
    $c->stash->{artist}         = $c->model('Artist')->load($release->artist);
    $c->stash->{tracks}         = $c->model('Track')->load_from_release($release);
    $c->stash->{release_events} = $c->model('Release')->load_events($release, country_id => 1);
}

sub change_quality : Chained('load') PathPart('change-quality') Edit {
    my ($self, $c) = @_;
    my $release = $c->stash->{release};
    $self->edit_action(
        $c,
        item => $release,
        form => 'ChangeReleaseQuality',
        type => $EDIT_RELEASE_CHANGE_QUALITY,
        edit_args => { to_edit => $release },
        on_creation => sub {
            my $uri = $c->uri_for_action('/release/show', [ $release->gid ]);
            $c->response->redirect($uri);
        },
    );

    my %props = (
        form => $c->stash->{form}->TO_JSON,
        release => $release->TO_JSON,
    );

    $c->stash(
        component_path => 'release/ChangeQuality',
        component_props => \%props,
        current_view => 'Node',
    );
}

with 'MusicBrainz::Server::Controller::Role::Merge' => {
    edit_type => $EDIT_RELEASE_MERGE,
    merge_form => 'Merge::Release',
};

sub _merge_form_arguments {
    my ($self, $c, @releases) = @_;
    $c->model('Track')->load_for_mediums(map { $_->all_mediums } @releases);
    $c->model('Recording')->load(map { $_->all_tracks } map { $_->all_mediums } @releases);
    $c->model('ArtistCredit')->load(map { $_->all_tracks } map { $_->all_mediums } @releases);

    my @mediums;
    my %medium_by_id;
    foreach my $release (@releases) {
        foreach my $medium ($release->all_mediums) {
            my $position = $medium->position;
            my $name = $medium->name;
            if ($release->medium_count == 1 && !$name) {
                # guess position from the old release name
                if ($medium->release->name =~ /\(disc (\d+)(?:: (.+?))?\)/i) {
                    $position = $1;
                    $name = $2 || '';
                }
            }
            push @mediums, {
                id => $medium->id,
                release_id => $medium->release_id,
                release => $medium->release,
                position => $position,
                name => $name,
            };
            $medium_by_id{$medium->id} = $medium;
        }
    }

    @mediums = nsort_by { $_->{position} } @mediums;

    $c->stash(
        mediums => [ map { $medium_by_id{$_->{id}} } @mediums ],
    );

    return (
        init_object => { medium_positions => { map => \@mediums } },
    );
}

sub _merge_parameters {
    my ($self, $c, $form, $releases) = @_;
    if ($form->field('merge_strategy')->value == $MusicBrainz::Server::Data::Release::MERGE_APPEND) {
        my %release_map = map {
            $_->id => $_
        } @$releases;
        my %medium_changes;
        for my $merge ($form->field('medium_positions.map')->fields) {
            my $release = $release_map{ $merge->field('release_id')->value }
                or die 'Couldnt find release to link with';

            my ($medium) = grep { $_->id == $merge->field('id')->value }
                $release->all_mediums
                    or die 'Couldnt find medium';

            push @{ $medium_changes{ $release->id } },
                { id => $merge->field('id')->value,
                  old_position => $medium->position,
                  new_position => $merge->field('position')->value,
                  old_name => $medium->name,
                  new_name => $merge->field('name')->value // '' };
        }
        return (
            medium_changes => [
                map +{
                    release => {
                        id => $_,
                        name => $release_map{$_}->name,
                    },
                    mediums => $medium_changes{$_},
                }, keys %medium_changes,
            ],
        );
    } else {
        return ();
    }
}

sub _merge_on_creation {
    my ($self, $c, $edit, $form, $new, $old_ids, $entities_by_id) = @_;
    if ($form->field('merge_rgs')->value) {
        my $edit_id = $edit->id;

        my $new_rg_id = $new->release_group->id;
        # We want to make sure we're merging only different RGs!
        my @old_entities = map +{ id => $_->id, name => $_->name },
            grep { $_->id != $new_rg_id }
            map { $entities_by_id->{$_}->release_group }
            @$old_ids;
        if (scalar @old_entities) {
            my $rg_edit = $self->_insert_edit(
                $c, $form,
                edit_type => $EDIT_RELEASEGROUP_MERGE,
                editor_id => $c->user->id,
                old_entities => \@old_entities,
                new_entity => {
                    id => $new_rg_id,
                    name => $new->release_group->name,
                },
            );
            my $rg_edit_id = $rg_edit->id;
            $c->model('EditNote')->add_note(
                $rg_edit_id,
                {
                    text => localized_note(
                        N_l('These release groups are being merged in connection with a release merge in {edit_link|edit #{edit_id}}.'),
                        vars => {
                            edit_id => $edit_id,
                            edit_link => '' . $c->uri_for_action('/edit/show', [ $edit_id ]),
                        },
                    ),
                    editor_id => $EDITOR_MODBOT,
                },
            );
            $c->model('EditNote')->add_note(
                $edit_id,
                {
                    text => localized_note(
                        N_l('The associated release groups are being merged in {edit_link|edit #{edit_id}}.'),
                        vars => {
                            edit_id => $rg_edit_id,
                            edit_link => '' . $c->uri_for_action('/edit/show', [ $rg_edit_id ]),
                        },
                    ),
                    editor_id => $EDITOR_MODBOT,
                },
            );
        }
    } else {
        return ();
    }
}

sub _extra_entity_data {
    my ($self, $c, $form, $release) = @_;
    my @args;
    push(@args, barcode => $release->barcode->code) if $release->barcode;
    push(@args, artist_credit => artist_credit_to_ref($release->artist_credit));
    push(@args, events => [map +{ country_id => $_->country_id, date => partial_date_to_hash($_->date) }, $release->all_events]);
    push(@args, mediums => [map +{ track_count => $_->track_count, format_name => $_->format_name }, $release->all_mediums]);
    push(@args, labels => [map +{ label => ($_->label ? { id => $_->label->id, name => $_->label->name } : undef), catalog_number => $_->catalog_number }, $release->all_labels]);
    return @args;
}

around _validate_merge => sub {
    my ($orig, $self, $c, $form) = @_;

    my $releases = $c->stash->{to_merge};
    my @release_ids = map { $_->id } @{$releases};

    # If the form was submitted, $releases should already be sorted with the
    # release merge target first; see `_merge_confirm` in
    # Controller::Role::Merge. So at any point below the call to
    # `$self->$orig`, we can assume the recording merge targets are correct.
    # But we calculate them *now* because @bad_recording_merges (see below)
    # are needed before we validate the form.
    my ($can_merge_recordings, $recording_merge_result) =
        $c->model('Release')->determine_recording_merges(@release_ids);

    # `bad_recording_merges` contains recording merges where the artists
    # differ, as a warning for the user. These are calculated even before
    # form is validated or a merge strategy is selected, so that they can
    # be displayed to the user immediately (with JavaScript).
    if ($can_merge_recordings) {
        my @bad_recording_merges;
        for my $recording_merge (@{$recording_merge_result}) {
            my @ac_ids = (
                $recording_merge->{destination}{artist_credit_id},
                map { $_->{artist_credit_id} } @{$recording_merge->{sources}},
            );
            if (uniq(@ac_ids) > 1) {
                push @bad_recording_merges, [
                    Recording->new($recording_merge->{destination}),
                    map { Recording->new($_) } @{$recording_merge->{sources}},
                ];
            }
        }
        if (@bad_recording_merges) {
            $c->model('ArtistCredit')->load(map { @$_ } @bad_recording_merges);
        }

        $c->stash(
            bad_recording_merges => [
                map { to_json_array($_) } @bad_recording_merges,
            ],
        );
    }

    return 0 unless $self->$orig($c, $form);
    # The entity-specific form data was submitted and is valid.

    my $new_id = $form->field('target')->value;
    my @old_ids = @release_ids[1 .. $#release_ids];

    die 'unexpected merge target'
        unless $release_ids[0] eq $new_id;

    my $strat = $form->field('merge_strategy')->value;
    my %merge_opts = (
        merge_strategy => $strat,
        new_id => $new_id,
        old_ids => \@old_ids,
    );

    # XXX Ripped from Edit/Release/Merge.pm need to find a better solution.
    if ($strat == $MusicBrainz::Server::Data::Release::MERGE_APPEND) {
        my %extra_params = $self->_merge_parameters($c, $form, $releases);
        $merge_opts{ medium_positions } = {
            map { $_->{id} => $_->{new_position} }
            map { @{ $_->{mediums} } }
                @{ $extra_params{medium_changes} },
        };
    }

    my ($can_merge, $cannot_merge_reason) = $c->model('Release')->can_merge(\%merge_opts);

    if ($can_merge &&
            $strat == $MusicBrainz::Server::Data::Release::MERGE_MERGE &&
            !$can_merge_recordings) {
        $can_merge = 0;
        $cannot_merge_reason = $recording_merge_result;
    }

    unless ($can_merge) {
        $form->field('merge_strategy')->add_error(
            l('This merge strategy is not applicable to the releases you have selected.'),
        );
        $form->field('merge_strategy')->add_error(
            l($cannot_merge_reason->{message}, $cannot_merge_reason->{vars} // {}),
        );
        return 0;
    }

    return 1;
};

sub _merge_load_entities {
    my ($self, $c, @releases) = @_;
    $c->model('ArtistCredit')->load(@releases);
    $c->model('Release')->load_aliases(@releases);
    $c->model('Release')->load_related_info(@releases);
    $c->model('ReleaseGroup')->load(@releases);
}

with 'MusicBrainz::Server::Controller::Role::Delete' => {
    edit_type        => $EDIT_RELEASE_DELETE,
    create_edit_type => $EDIT_RELEASE_CREATE,
};

sub edit_relationships : Chained('load') PathPart('edit-relationships') Edit {
    my ($self, $c) = @_;

    my $release = $c->stash->{release};
    $c->model('Release')->load_aliases($release);
    $c->model('Release')->load_meta($release);
    $c->model('ArtistCredit')->load($release);
    $c->model('ReleaseGroup')->load($release);
    $c->model('ReleaseGroup')->load_meta($release->release_group);
    $c->model('Relationship')->load_cardinal($release->release_group);

    $self->_load_mediums_limited($c, $release->mediums, undef, 1);

    $c->stash(
        component_path => 'release/EditRelationships',
        component_props => {},
        current_view => 'Node',
        source_entity => to_json_object($release),
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 MetaBrainz Foundation

This file is part of MusicBrainz, the open internet music database,
and is licensed under the GPL version 2, or (at your option) any
later version: http://www.gnu.org/licenses/gpl-2.0.txt

=cut
