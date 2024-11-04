package t::MusicBrainz::Server::Controller::Work::Details;
use strict;
use warnings;

use Test::Routine;
use MusicBrainz::Server::Test qw( html_ok );

with 't::Mechanize', 't::Context';

=head1 DESCRIPTION

This test checks that the work details page contains all the expected data.

=cut

test 'Details tab has all the expected data' => sub {
    my $test = shift;
    my $mech = $test->mech;
    my $c    = $test->c;

    MusicBrainz::Server::Test->prepare_test_database($c);

    $mech->get_ok(
        '/work/745c079d-374e-4436-9448-da92dedef3ce/details',
        'Fetched work details page',
    );
    html_ok($mech->content);
    $mech->text_contains(
        'Permanent link:https://musicbrainz.org/work/745c079d-374e-4436-9448-da92dedef3ce',
        'The details tab contains the work permalink',
    );
    $mech->text_contains(
        'MBID:745c079d-374e-4436-9448-da92dedef3ce',
        'The details tab contains the MBID in plain text',
    );
    $mech->text_contains(
        'Last updated:1999-01-02 12:00 UTC',
        'The details tab contains the last updated date',
    );
    $mech->text_contains(
        '/ws/2/work/745c079d-374e-4436-9448-da92dedef3ce?',
        'The details tab contains a WS link',
    );
};

1;
