package WebRHINO::Schema::ResultSet::User;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';

sub update_user {
    my ( $self ) = @_;
    
    my @users = $self->all; # SELECT * FROM user;
    
    for my $user ( @users ) { # For each user into list of users
        $user->password( '123Mudar' ); # set password = '123Mudar'
        $user->update; # UPDATE user set password = '123Mudar(**HASHED**)';
    }
}

1;
