package MusicBrainz::Server::Edit::Historic::MergeArtist;
use strict;
use warnings;

use MusicBrainz::Server::Translation qw ( l ln );

use base 'MusicBrainz::Server::Edit::Historic::NGSMigration';

sub edit_name { l('Merge artists') }
sub edit_type { 6 }
sub ngs_class { 'MusicBrainz::Server::Edit::Artist::Merge' }

sub do_upgrade
{
    my $self = shift;

    return {
        new_entity => {
            id => $self->new_value->{ArtistId},
            name => $self->new_value->{ArtistName}
        },
        old_entities => [
            { id => $self->row_id, name => $self->previous_value }
        ],
    };
};

sub deserialize_new_value
{
    my ($self, $new) = @_;

    my $unpacked = $self->deserialize($new);

    if (!keys %$unpacked) {
        my @lines = split /\n/, $new;
        $unpacked = {
            ArtistName => $lines[1] || $lines[0],
            ArtistId   => $self->artist_id,
        };
    }

    return $unpacked;
}

sub deserialize_previous_value
{
    my $self = shift;
    return shift;
}

1;
