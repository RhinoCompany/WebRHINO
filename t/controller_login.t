use strict;
use warnings;
use Test::More;


use Catalyst::Test 'WebRHINO';
use WebRHINO::Controller::login;

ok( request('/login')->is_success, 'Request should succeed' );
done_testing();
