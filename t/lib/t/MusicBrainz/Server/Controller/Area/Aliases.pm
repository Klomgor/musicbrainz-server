package t::MusicBrainz::Server::Controller::Area::Aliases;
use utf8;
use strict;
use warnings;

use Test::Routine;
use MusicBrainz::Server::Test qw( html_ok page_test_jsonld );

with 't::Mechanize', 't::Context';

=head1 DESCRIPTION

This test checks whether area aliases are correctly listed on the area
alias page, both on the site itself and on the JSON-LD data.

=cut

test 'Area alias appears on alias page content and on JSON-LD' => sub {
    my $test = shift;
    my $mech = $test->mech;
    my $c = $test->c;

    MusicBrainz::Server::Test->prepare_test_database($c, '+area');

    $mech->get_ok(
        '/area/106e0bec-b638-3b37-b731-f53d507dc00e/aliases',
        'Fetched area aliases page',
    );
    html_ok($mech->content);

    $mech->text_contains('オーストラリア', 'Alias page lists the alias');
    $mech->text_contains('Area name', 'Alias page lists the alias type');

    page_test_jsonld $mech => {
        '@id' => 'http://musicbrainz.org/area/106e0bec-b638-3b37-b731-f53d507dc00e',
        'alternateName' => ["\N{KATAKANA LETTER O}\N{KATAKANA-HIRAGANA PROLONGED SOUND MARK}\N{KATAKANA LETTER SU}\N{KATAKANA LETTER TO}\N{KATAKANA LETTER RA}\N{KATAKANA LETTER RI}\N{KATAKANA LETTER A}"],
        '@context' => 'https://schema.org/docs/jsonldcontext.json',
        'name' => 'Australia',
        '@type' => 'Country',
    };
};

1;
