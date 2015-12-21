use strict;
use warnings;
use Test::More;


use Catalyst::Test 'WebRHINO';
use WebRHINO::Controller::admin;

ok( request('/admin')->is_success, 'Request should succeed' );
done_testing();
