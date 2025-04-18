package MusicBrainz::Server::Data::Place;

use Moose;
use namespace::autoclean;
use MusicBrainz::Server::Data::Edit;
use MusicBrainz::Server::Entity::Place;
use MusicBrainz::Server::Entity::Coordinates;
use MusicBrainz::Server::Entity::PartialDate;
use MusicBrainz::Server::Data::Utils qw(
    add_partial_date_to_row
    add_coordinates_to_row
    hash_to_row
    load_subobjects
    order_by
    merge_table_attributes
    merge_string_attributes
    merge_date_period
);
use MusicBrainz::Server::Data::Utils::Cleanup qw( used_in_relationship );

extends 'MusicBrainz::Server::Data::Entity';
with 'MusicBrainz::Server::Data::Role::Relatable',
     'MusicBrainz::Server::Data::Role::GIDRedirect',
     'MusicBrainz::Server::Data::Role::Name',
     'MusicBrainz::Server::Data::Role::Annotation' => { type => 'place' },
     'MusicBrainz::Server::Data::Role::Alias' => { type => 'place' },
     'MusicBrainz::Server::Data::Role::GIDEntityCache',
     'MusicBrainz::Server::Data::Role::DeleteAndLog' => { type => 'place' },
     'MusicBrainz::Server::Data::Role::PendingEdits' => { table => 'place' },
     'MusicBrainz::Server::Data::Role::Rating' => { type => 'place' },
     'MusicBrainz::Server::Data::Role::Tag' => { type => 'place' },
     'MusicBrainz::Server::Data::Role::LinksToEdit' => { table => 'place' },
     'MusicBrainz::Server::Data::Role::Merge',
     'MusicBrainz::Server::Data::Role::Area',
     'MusicBrainz::Server::Data::Role::Collection';

sub _type { 'place' }

sub _build_columns
{
    return join q(, ), (
        'place.id',
        'place.gid',
        'place.name COLLATE musicbrainz',
        'place.type',
        'place.address',
        'place.area',
        'place.coordinates[0] as coordinates_x',
        'place.coordinates[1] as coordinates_y',
        'place.edits_pending',
        'place.begin_date_year',
        'place.begin_date_month',
        'place.begin_date_day',
        'place.end_date_year',
        'place.end_date_month',
        'place.end_date_day',
        'place.ended',
        'place.comment',
        'place.last_updated',
    );
}

has '_columns' => (
    is => 'ro',
    isa => 'Str',
    lazy => 1,
    builder => '_build_columns',
);

sub _id_column
{
    return 'place.id';
}

sub _column_mapping
{
    return {
        id => 'id',
        gid => 'gid',
        name => 'name',
        type_id => 'type',
        address => 'address',
        area_id => 'area',
        coordinates =>  sub { MusicBrainz::Server::Entity::Coordinates->new_from_row(shift, shift() . 'coordinates') },
        begin_date => sub { MusicBrainz::Server::Entity::PartialDate->new_from_row(shift, shift() . 'begin_date_') },
        end_date => sub { MusicBrainz::Server::Entity::PartialDate->new_from_row(shift, shift() . 'end_date_') },
        edits_pending => 'edits_pending',
        comment => 'comment',
        last_updated => 'last_updated',
        ended => 'ended',
    };
}

sub _area_columns
{
    return ['area'];
}

sub load
{
    my ($self, @objs) = @_;
    load_subobjects($self, 'place', @objs);
}

sub update
{
    my ($self, $place_id, $update) = @_;

    my $row = $self->_hash_to_row($update);

    $self->sql->update_row('place', $row, { id => $place_id }) if %$row;

    return 1;
}

sub can_delete {1}

sub delete
{
    my ($self, @place_ids) = @_;

    $self->c->model('Collection')->delete_entities('place', @place_ids);
    $self->c->model('Relationship')->delete_entities('place', @place_ids);
    $self->annotation->delete(@place_ids);
    $self->alias->delete_entities(@place_ids);
    $self->rating->delete(@place_ids);
    $self->tags->delete(@place_ids);
    $self->remove_gid_redirects(@place_ids);
    $self->delete_returning_gids(@place_ids);
    return 1;
}

sub _merge_impl
{
    my ($self, $new_id, @old_ids) = @_;

    $self->alias->merge($new_id, @old_ids);
    $self->tags->merge($new_id, @old_ids);
    $self->rating->merge($new_id, @old_ids);
    $self->annotation->merge($new_id, @old_ids);
    $self->c->model('Edit')->merge_entities('place', $new_id, @old_ids);
    $self->c->model('Collection')->merge_entities('place', $new_id, @old_ids);
    $self->c->model('Relationship')->merge_entities('place', $new_id, \@old_ids);

    my @merge_options = ($self->sql => (
                           table => 'place',
                           old_ids => \@old_ids,
                           new_id => $new_id,
                        ));

    merge_table_attributes(@merge_options, columns => [ qw( type area coordinates ) ]);
    merge_string_attributes(@merge_options, columns => [ qw( address ) ]);
    merge_date_period(@merge_options);

    $self->_delete_and_redirect_gids('place', $new_id, @old_ids);
    return 1;
}

sub _hash_to_row
{
    my ($self, $place) = @_;

    my $row = hash_to_row($place, {
        area => 'area_id',
        type => 'type_id',
        map { $_ => $_ } qw( address comment ended name ),
    });

    add_partial_date_to_row($row, $place->{begin_date}, 'begin_date');
    add_partial_date_to_row($row, $place->{end_date}, 'end_date');
    add_coordinates_to_row($row, $place->{coordinates}, 'coordinates')
        if exists $place->{coordinates};

    return $row;
}

sub load_meta
{
    my $self = shift;
    MusicBrainz::Server::Data::Utils::load_meta($self->c, 'place_meta', sub {
        my ($obj, $row) = @_;
        $obj->rating($row->{rating}) if defined $row->{rating};
        $obj->rating_count($row->{rating_count}) if defined $row->{rating_count};
    }, @_);
}

sub is_empty {
    my ($self, $place_id) = @_;

    my $used_in_relationship = used_in_relationship($self->c, place => 'place_row.id');
    return $self->sql->select_single_value(<<~"SQL", $place_id);
        SELECT TRUE
        FROM place place_row
        WHERE id = ?
        AND NOT ($used_in_relationship)
        SQL
}

sub _order_by {
    my ($self, $order) = @_;
    my $order_by = order_by($order, 'name', {
        'name' => sub {
            return 'name COLLATE musicbrainz';
        },
        'area' => sub {
            return 'area, name COLLATE musicbrainz';
        },
        'address' => sub {
            return 'address COLLATE musicbrainz, name COLLATE musicbrainz';
        },
        'begin_date' => sub {
            return 'begin_date_year, begin_date_month, begin_date_day, name COLLATE musicbrainz';
        },
        'end_date' => sub {
            return 'end_date_year, end_date_month, end_date_day, name COLLATE musicbrainz';
        },
        'type' => sub {
            return 'type, name COLLATE musicbrainz';
        },
    });

    return $order_by;
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013-2015 MetaBrainz Foundation

This file is part of MusicBrainz, the open internet music database,
and is licensed under the GPL version 2, or (at your option) any
later version: http://www.gnu.org/licenses/gpl-2.0.txt

=cut
