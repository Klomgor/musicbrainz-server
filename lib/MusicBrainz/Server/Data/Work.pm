package MusicBrainz::Server::Data::Work;

use Moose;
use namespace::autoclean;
use List::AllUtils qw( uniq );
use MusicBrainz::Server::Data::Utils qw(
    hash_to_row
    load_subobjects
    merge_table_attributes
    order_by
    placeholders
);
use MusicBrainz::Server::Data::Utils::Cleanup qw( used_in_relationship );
use MusicBrainz::Server::Entity::Work;
use MusicBrainz::Server::Entity::WorkAttribute;
use MusicBrainz::Server::Entity::WorkAttributeType;
use MusicBrainz::Server::Translation qw( l );

extends 'MusicBrainz::Server::Data::Entity';
with 'MusicBrainz::Server::Data::Role::Relatable',
     'MusicBrainz::Server::Data::Role::GIDRedirect',
     'MusicBrainz::Server::Data::Role::Name',
     'MusicBrainz::Server::Data::Role::Annotation' => { type => 'work' },
     'MusicBrainz::Server::Data::Role::Alias' => { type => 'work' },
     'MusicBrainz::Server::Data::Role::GIDEntityCache',
     'MusicBrainz::Server::Data::Role::DeleteAndLog' => { type => 'work' },
     'MusicBrainz::Server::Data::Role::Rating' => { type => 'work' },
     'MusicBrainz::Server::Data::Role::Tag' => { type => 'work' },
     'MusicBrainz::Server::Data::Role::PendingEdits' => { table => 'work' },
     'MusicBrainz::Server::Data::Role::LinksToEdit' => { table => 'work' },
     'MusicBrainz::Server::Data::Role::Merge',
     'MusicBrainz::Server::Data::Role::Collection',
     'MusicBrainz::Server::Data::Role::ValueSet' => {
        entity_type         => 'work',
        plural_value_type   => 'languages',
        value_attribute     => 'language_id',
        value_class         => 'WorkLanguage',
        value_type          => 'language',
     };

sub _type { 'work' }

sub _build_columns
{
    return join q(, ), (
        'work.id',
        'work.gid',
        'work.type',
        'work.name COLLATE musicbrainz',
        'work.comment',
        'work.edits_pending',
        'work.last_updated',
    );
}

has '_columns' => (
    is => 'ro',
    isa => 'Str',
    lazy => 1,
    builder => '_build_columns',
);

sub _column_mapping
{
    return {
        id => 'id',
        gid => 'gid',
        name => 'name',
        type_id => 'type',
        comment => 'comment',
        last_updated => 'last_updated',
        edits_pending => 'edits_pending',
    };
}

sub _id_column
{
    return 'work.id';
}

sub find_by_artist
{
    my ($self, $artist_id, $limit, $offset, %args) = @_;

    my (@where_query, @where_args);

    # For the basic work query
    push @where_query, 'work.id = s.work';

    # Select works that are related to recordings for this artist
    my $performers_query = <<~'SQL';
        SELECT DISTINCT lrw.entity1 AS work
          FROM l_recording_work lrw
          JOIN recording r ON r.id = lrw.entity0
          JOIN artist_credit_name acn ON acn.artist_credit = r.artist_credit
         WHERE acn.artist = ?
        SQL

    # Select works that this artist is related to
    my $relationships_query = <<~'SQL';
        SELECT DISTINCT law.entity1 AS work
          FROM l_artist_work law
          JOIN link ON law.link = link.id
          JOIN link_type lt ON lt.id = link.link_type
         WHERE law.entity0 = ?
        SQL

    my $inner_query = $performers_query . ' UNION ' . $relationships_query;

    if (exists $args{filter}) {
        my %filter = %{ $args{filter} };

        if (exists $filter{role_type}) {
            if ($filter{role_type} == 1) {
                # Show only works as performer
                $inner_query = $performers_query;
                push @where_args, $artist_id;
            } elsif ($filter{role_type} == 2) {
                # Show only works as author
                my @authorship_gids =
                    $self->c->model('LinkType')->get_authorship_relationship_gids;
                my $extra_condition = ' AND lt.gid = any(?) ';
                $inner_query = $relationships_query . $extra_condition;
                push @where_args, $artist_id, [@authorship_gids];
            } elsif ($filter{role_type} == 3) {
                # Show only works with other rels than authorship ones
                my @authorship_gids =
                    $self->c->model('LinkType')->get_authorship_relationship_gids;
                my $extra_condition = ' AND NOT (lt.gid = any(?)) ';
                $inner_query = $relationships_query . $extra_condition;
                push @where_args, $artist_id, [@authorship_gids];
            }
        } else {
            push @where_args, ($artist_id) x 2;
        }

        if (exists $filter{name}) {
            push @where_query, "(mb_simple_tsvector(work.name) @@ plainto_tsquery('mb_simple', mb_lower(?)) OR work.name = ?)";
            push @where_args, ($filter{name}) x 2;
        }

        if (exists $filter{disambiguation}) {
            push @where_query, "(mb_simple_tsvector(work.comment) @@ plainto_tsquery('mb_simple', mb_lower(?)) OR work.comment = ?)";
            push @where_args, ($filter{disambiguation}) x 2;
        }

        if (exists $filter{type_id}) {
            if ($filter{type_id} eq '-1') {
                push @where_query, 'work.type IS NULL';
            } else {
                push @where_query, 'work.type = ?';
                push @where_args, $filter{type_id};
            }
        }

        if (exists $filter{language_id}) {
            if ($filter{language_id} eq '-1') {
                push @where_query, '(NOT EXISTS (SELECT 1 FROM work_language wl WHERE wl.work = work.id))';
            } else {
                push @where_query, 'EXISTS (SELECT 1 FROM work_language wl WHERE wl.work = work.id AND wl.language = ?)';
                push @where_args, $filter{language_id};
            }
        }
    } else {
        push @where_args, ($artist_id) x 2;
    }

    my $query =
        'SELECT ' . $self->_columns .'
           FROM ( ' . $inner_query . ' ) s, ' . $self->_table .'
          WHERE ' . join(' AND ', @where_query) . '
       ORDER BY work.name COLLATE musicbrainz';

    # We actually use this for the side effect in the closure
    $self->query_to_list_limited($query, \@where_args, $limit, $offset);
}

sub find_languages_by_artist
{
    my ($self, $artist_id) = @_;

    my $query = 'SELECT DISTINCT wl.language
                 FROM work_language wl
                 WHERE wl.work IN (
                    SELECT lrw.entity1 AS work
                      FROM l_recording_work lrw
                      JOIN recording r ON r.id = lrw.entity0
                      JOIN artist_credit_name acn ON acn.artist_credit = r.artist_credit
                     WHERE acn.artist = ?
                 ) OR wl.work IN (
                    SELECT law.entity1 AS work
                      FROM l_artist_work law
                      JOIN link ON law.link = link.id
                      JOIN link_type lt ON lt.id = link.link_type
                     WHERE law.entity0 = ?
                 )';
    my $ids = $self->sql->select_single_column_array($query, ($artist_id) x 2);
    return $self->c->model('Language')->get_by_ids_sorted_by_name(@$ids);
}

=method find_by_iswc

    find_by_iswc($iswc : Text)

Find works by their ISWC. Returns an array of
L<MusicBrainz::Server::Entity::Work> objects.

=cut

sub find_by_iswc
{
    my ($self, $iswc) = @_;
    my $query = 'SELECT ' . $self->_columns . '
                 FROM ' . $self->_table . '
                 JOIN iswc ON work.id = iswc.work
                 WHERE iswc.iswc = ?
                 ORDER BY work.name COLLATE musicbrainz';

    $self->query_to_list($query, [$iswc]);
}

sub _order_by {
    my ($self, $order) = @_;
    my $order_by = order_by($order, 'name', {
        'name' => sub {
            return 'name COLLATE musicbrainz';
        },
        'type' => sub {
            return 'type, name COLLATE musicbrainz';
        },
    });

    return $order_by;
}

sub load
{
    my ($self, @objs) = @_;
    load_subobjects($self, 'work', @objs);
}

sub update
{
    my ($self, $work_id, $update) = @_;
    return unless %{ $update // {} };
    my $row = $self->_hash_to_row($update);
    $self->sql->update_row('work', $row, { id => $work_id }) if %$row;
}

# Works can be unconditionally removed
sub can_delete { 1 }

sub delete {
    my ($self, $work_id) = @_;

    $self->c->model('Collection')->delete_entities('work', $work_id);
    $self->c->model('Relationship')->delete_entities('work', $work_id);
    $self->annotation->delete($work_id);
    $self->alias->delete_entities($work_id);
    $self->language->delete_entities($work_id);
    $self->tags->delete($work_id);
    $self->rating->delete($work_id);
    $self->c->model('ISWC')->delete_works($work_id);
    $self->remove_gid_redirects($work_id);
    $self->sql->do('DELETE FROM work_attribute WHERE work = ?', $work_id);
    $self->delete_returning_gids($work_id);
    return;
}

sub _merge_impl
{
    my ($self, $new_id, @old_ids) = @_;

    $self->alias->merge($new_id, @old_ids);
    $self->annotation->merge($new_id, @old_ids);
    $self->language->merge($new_id, @old_ids);
    $self->tags->merge($new_id, @old_ids);
    $self->rating->merge($new_id, @old_ids);
    $self->c->model('Edit')->merge_entities('work', $new_id, @old_ids);
    $self->c->model('Collection')->merge_entities('work', $new_id, @old_ids);
    $self->c->model('Relationship')->merge_entities('work', $new_id, \@old_ids);
    $self->c->model('ISWC')->merge_works($new_id, @old_ids);

    $self->sql->do(
        'WITH all_attributes AS (
           DELETE FROM work_attribute WHERE work = any(?)
           RETURNING work_attribute_type, work_attribute_text,
           work_attribute_type_allowed_value
         )
         INSERT INTO work_attribute
           (work, work_attribute_type, work_attribute_text,
           work_attribute_type_allowed_value)
         SELECT DISTINCT ON
           (work_attribute_type,
            coalesce(work_attribute_text, work_attribute_type_allowed_value::text))
           ?, work_attribute_type, work_attribute_text,
           work_attribute_type_allowed_value
         FROM all_attributes',
      [ $new_id, @old_ids ], $new_id,
    );

    merge_table_attributes(
        $self->sql => (
            table => 'work',
            columns => [ qw( type ) ],
            old_ids => \@old_ids,
            new_id => $new_id,
        ),
    );

    $self->_delete_and_redirect_gids('work', $new_id, @old_ids);
    return 1;
}

sub _hash_to_row
{
    my ($self, $work) = @_;

    my $row = hash_to_row($work, {
        type => 'type_id',
        map { $_ => $_ } qw( comment name ),
    });

    return $row;
}

sub load_meta
{
    my $self = shift;
    MusicBrainz::Server::Data::Utils::load_meta($self->c, 'work_meta', sub {
        my ($obj, $row) = @_;
        $obj->rating($row->{rating}) if defined $row->{rating};
        $obj->rating_count($row->{rating_count}) if defined $row->{rating_count};
        $obj->last_updated($row->{last_updated}) if defined $row->{last_updated};
    }, @_);
}

sub load_related_info {
    my ($self, @works) = @_;

    my $c = $self->c;
    $c->model('Work')->load_authors(@works);
    $c->model('Work')->load_other_artists(@works);
    $c->model('Work')->load_recording_artists(@works);
    $c->model('WorkAttribute')->load_for_works(@works);
    $c->model('ISWC')->load_for_works(@works);
    $c->model('WorkType')->load(@works);
    $c->model('Language')->load_for_works(@works);
}

=method load_ids

Load internal IDs for work objects that only have GIDs.

=cut

sub load_ids
{
    my ($self, @works) = @_;

    my @gids = map { $_->gid } @works;
    return () unless @gids;

    my $query = '
        SELECT gid, id FROM work
        WHERE gid IN (' . placeholders(@gids) . ')
    ';
    my %map = map { $_->[0] => $_->[1] }
        @{ $self->sql->select_list_of_lists($query, @gids) };

    for my $work (@works) {
        $work->id($map{$work->gid}) if exists $map{$work->gid};
    }
}

=method find_artists

This method will return a map with lists of artist names for the given
recordings. The names are taken from both authors and recording artists.
This function is meant to be used to disambiguate works (e.g. in lookup
results).

=cut

sub find_artists
{
    my ($self, $works, $limit) = @_;

    my @ids = map { $_->id } @$works;
    return () unless @ids;

    my (%authors, %artists);
    $self->_find_authors_or_other_artists(\@ids, \%authors);
    $self->_find_recording_artists(\@ids, \%artists);

    my %map;

    for my $work_id (@ids) {
        my @artists = uniq map { $_->{entity}->name } @{ $artists{$work_id} };
        my @authors = uniq map {
            my $name = $_->{entity}->name;
            my $primary_alias = $_->{entity}->primary_alias;
            $name . (
                $primary_alias && $primary_alias ne $name
                    ? ' ' . l('({text})', { text => $primary_alias })
                    : ''
            ),
        } @{ $authors{$work_id} };

        $map{$work_id} = {
            authors => {
                hits => scalar @authors,
                results => $limit && scalar @authors > $limit
                    ? [ @authors[ 0 .. ($limit-1) ] ]
                    : \@authors,
            },
            artists => {
                hits => scalar @artists,
                results => $limit && scalar @artists > $limit
                    ? [ @artists[ 0 .. ($limit-1) ] ]
                    : \@artists,
            },
        };
    }

    return %map;
}

=method load_authors

This method will load the work's authors based on the work-artist
relationships.

=cut

sub load_authors
{
    my ($self, @works) = @_;

    @works = grep { defined $_ && scalar $_->all_authors == 0 } @works;
    my @ids = map { $_->id } @works;
    return () unless @ids;

    my %map;
    $self->_find_authors_or_other_artists(\@ids, \%map);
    for my $work (@works) {
        $work->add_author(@{ $map{$work->id} })
            if exists $map{$work->id};
    }
}

sub load_other_artists
{
    my ($self, @works) = @_;

    @works = grep { defined $_ && scalar $_->all_other_artists == 0 } @works;
    my @ids = map { $_->id } @works;
    return () unless @ids;

    my %map;
    $self->_find_authors_or_other_artists(\@ids, \%map, 1);
    for my $work (@works) {
        $work->add_other_artist(@{ $map{$work->id} })
            if exists $map{$work->id};
    }
}

sub _find_authors_or_other_artists
{
    my ($self, $ids, $map, $find_other) = @_;
    return unless @$ids;

    my @authorship_gids =
        $self->c->model('LinkType')->get_authorship_relationship_gids;
    my $reltypes_condition;
    if ($find_other) {
        $reltypes_condition = 'AND NOT (lt.gid = any(?)) ';
    } else {
        $reltypes_condition = 'AND lt.gid = any(?) ';
    }

    my $query = <<~"SQL";
          SELECT law.entity1 AS work,
                 law.entity0 AS artist,
                 law.entity0_credit AS credit,
                 array_agg(lt.name ORDER BY lt.name) AS roles
            FROM l_artist_work law
            JOIN link l ON law.link = l.id
            JOIN link_type lt ON l.link_type = lt.id
           WHERE law.entity1 = any(?)
                 $reltypes_condition
        GROUP BY law.entity1, law.entity0, law.entity0_credit
        ORDER BY count(*) DESC, artist, credit
        SQL

    my $rows = $self->sql->select_list_of_lists(
        $query,
        $ids,
        [@authorship_gids],
    );

    my @artist_ids = map { $_->[1] } @$rows;
    my $artists = $self->c->model('Artist')->get_by_ids(@artist_ids);
    $self->c->model('Artist')->load_aliases(values %$artists);

    for my $row (@$rows) {
        my ($work_id, $artist_id, $credit, $roles) = @$row;
        $map->{$work_id} ||= [];
        push @{ $map->{$work_id} }, {
            credit => $credit,
            entity => $artists->{$artist_id},
            roles => [ uniq @{ $roles } ],
        };
    }
}

=method load_recording_artists

This method will load the work's artists based on the recordings the work
is linked to. The artist credits are sorted by the number of tracks for
the recordings by that artist in descending order. This ensures the 
artists most associated with the work will be listed first.

=cut

sub load_recording_artists
{
    my ($self, @works) = @_;

    @works = grep { defined $_ && scalar $_->all_artists == 0 } @works;
    my @ids = map { $_->id } @works;
    return () unless @ids;

    my %map;
    $self->_find_recording_artists(\@ids, \%map);
    for my $work (@works) {
        $work->add_artist(map { $_->{entity} } @{ $map{$work->id} })
            if exists $map{$work->id};
    }
}

sub _find_recording_artists
{
    my ($self, $ids, $map) = @_;
    return unless @$ids;

    my $query = '
        SELECT lrw.entity1 AS work, r.artist_credit
        FROM l_recording_work lrw
        JOIN recording r ON lrw.entity0 = r.id
        LEFT JOIN track t ON r.id = t.recording
        WHERE lrw.entity1 IN (' . placeholders(@$ids) . ')
        GROUP BY lrw.entity1, r.artist_credit
        ORDER BY count(*) DESC, artist_credit
    ';

    my $rows = $self->sql->select_list_of_lists($query, @$ids);

    my @artist_credit_ids = map { $_->[1] } @$rows;
    my $artist_credits = $self->c->model('ArtistCredit')->get_by_ids(@artist_credit_ids);

    my %work_acs;
    for my $row (@$rows) {
        my ($work_id, $ac_id) = @$row;
        $work_acs{$work_id} ||= [];
        push @{ $work_acs{$work_id} }, $ac_id;
    }

    for my $work_id (keys %work_acs) {
        my $artist_credit_ids = $work_acs{$work_id};
        $map->{$work_id} ||= [];
        push @{ $map->{$work_id} }, map +{
            entity => $artist_credits->{$_},
        }, @$artist_credit_ids;
    }
}

sub is_empty {
    my ($self, $work_id) = @_;

    my $used_in_relationship = used_in_relationship($self->c, work => 'work_row.id');
    return $self->sql->select_single_value(<<~"SQL", $work_id);
        SELECT TRUE
        FROM work work_row
        WHERE id = ?
        AND NOT ($used_in_relationship)
        SQL
}

sub set_attributes {
    my ($self, $work_id, @attributes) = @_;
    $self->sql->do('DELETE FROM work_attribute WHERE work = ?', $work_id);
    $self->sql->insert_many(
        'work_attribute',
        map +{
            work => $work_id,
            work_attribute_type => $_->{attribute_type_id},
            work_attribute_text =>
                exists $_->{attribute_text} ?  $_->{attribute_text} : undef,
            work_attribute_type_allowed_value =>
                exists $_->{attribute_value_id} ? $_->{attribute_value_id} :
                    undef,
        }, @attributes,
    );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 MetaBrainz Foundation
Copyright (C) 2009 Lukas Lalinsky

This file is part of MusicBrainz, the open internet music database,
and is licensed under the GPL version 2, or (at your option) any
later version: http://www.gnu.org/licenses/gpl-2.0.txt

=cut
