package t::MusicBrainz::Server::Controller::Release::AddAnnotation;
use strict;
use warnings;

use Test::Routine;
use Test::More;
use MusicBrainz::Server::Test qw( capture_edits );

with 't::Mechanize', 't::Context';

=head1 DESCRIPTION

This test checks whether adding annotations for releases works, including
whether four spaces at the start of the annotation are left untrimmed
(for list syntax). This tests only the edit annotation page, not submitting
annotations through the release editor.

=cut

test 'Adding release annotations' => sub {
    my $test = shift;
    my $mech = $test->mech;
    my $c    = $test->c;

    MusicBrainz::Server::Test->prepare_test_database($c);

    $mech->get_ok('/login');
    $mech->submit_form( with_fields => { username => 'new_editor', password => 'password' } );

    $mech->get_ok(
        '/release/f205627f-b70a-409d-adbe-66289b614e80/edit_annotation',
        'Fetched the edit annotation page',
    );
    my @edits = capture_edits {
        $mech->submit_form_ok({
            with_fields => {
                'edit-annotation.text' => "    * Test annotation\N{BEL} for a release  \r\n\r\n\t\N{NO-BREAK SPACE}\r\n    * This anno\N{ZERO WIDTH SPACE}tation has\ttwo bul\N{SOFT HYPHEN}lets  \t\t",
                'edit-annotation.changelog' => 'Changelog here',
            },
        },
        'The form returned a 2xx response code')
    } $test->c;

    ok(
        $mech->uri =~ qr{/release/f205627f-b70a-409d-adbe-66289b614e80/?$},
        'The user is redirected to the release page after entering the edit',
    );

    is(@edits, 1, 'The edit was entered');

    my $edit = shift(@edits);

    isa_ok($edit, 'MusicBrainz::Server::Edit::Release::AddAnnotation');
    is_deeply(
        $edit->data,
        {
            entity => {
                id => 2,
                name => 'Aerial',
            },
            text => "    * Test annotation for a release\n\n    * This anno\N{ZERO WIDTH SPACE}tation has\ttwo bul\N{SOFT HYPHEN}lets",
            changelog => 'Changelog here',
            editor_id => 1,
            old_annotation_id => undef,
        },
        'The edit contains the right data (with untrimmed initial spaces)',
    );

    $mech->get_ok('/edit/' . $edit->id, 'Fetched edit page');

    $mech->content_contains('Changelog here', 'Edit page contains changelog');
    $mech->content_contains('Aerial', 'Edit page contains release name');
    $mech->content_like(
        qr{release/f205627f-b70a-409d-adbe-66289b614e80/?"},
        'Edit page has a link to the release',
    );
};

1;
