#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use Catalyst::Test 'WebRHINO';

my $response = request('/');
ok( $response->code == 302 , 'Request should redirect' );
 
use URI;
my $uri = URI->new( $response->header('location') );

is( $uri->path, '/login', 'Check if is login' );

done_testing();
