use strict;
use warnings;
use Test::More;


use Catalyst::Test 'WebRHINO';
use WebRHINO::Controller::login;

diag("Let's check if login is available");
ok( request('/login')->is_success, 'Request should succeed' );

use HTTP::Request::Common;

diag("Let's try to login ( Expected: pass )");
my $response = request POST '/login', [
    username => 'admin.rhino',
    password => '123Mudar'
];

diag("If the response redirected to '/', pass");
is( $response->code, 302, "Ok for Login" );

use URI;
my $uri = URI->new( $response->header('location') );

diag("Checks if the path is root ('/')");
is( $uri->path, '/', "The redirected path is /"); 

done_testing();
