use strict;
use warnings;
use Test::More;


use Catalyst::Test 'WebRHINO';
use WebRHINO::Controller::admin::user;

ok( request('/admin/user')->is_success, 'Request should succeed' );
done_testing();
