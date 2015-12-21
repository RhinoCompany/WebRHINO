package WebRHINO::Schema::ResultSet::User;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';

sub exists {
    my ( $self, $user ) = @_;
    
    $user =~ s/\s/./;
    $user = lc $user;
    
    return 1 if $self->find({ username => $user });
    
    return 0;
}

sub new_user {
    my ( $self, $user_params ) = @_;
    
    my @roles;
    
    my $user = $self->create({
        name         => $user_params->{ first_name },
        last_name    => $user_params->{ last_name },
        username     => $user_params->{ username },
        email        => $user_params->{ email },
        password     => $user_params->{ password },
    });
    
    if ( $user_params->{ role } == 9 ) { @roles = qw/ 1 9 /; }
    else { @roles = qw/ 1 /; }
    
    for my $role ( @roles ){
        $user->add_to_user_roles( { user_id => $user->id, role_id => $role } );
    }
}

sub update_all {
    my ( $self ) = @_;
    
    my @users = $self->all;
    
    for my $user ( @users ) {
        $user->password( '123mudar' );
        $user->update;
    }
}

sub update_user {
    my ( $self, $username, $role ) = @_;
    
    my $user = $self->find({ username => $username });
    my $first_name   = $& if $username =~ m/^\w+/;
    my $last_name    = $' if $username =~ m/\.+/;
    my @roles;
    
    my $user_updated = $user->update({
        first_name   => $first_name,
        last_name    => $last_name,
        username     => $username,
        email        => "$username\@morpho.com"
    });
    
    if ( $role == 2 ) { @roles = qw/ 1 2 /; }
    elsif ( $role == 9 ) { @roles = qw/ 1 2 9 /; }
    else { @roles = qw/ 1 /; }
    
    my $user_roles = $self->search_related('user_roles', { user_id => $user->uid });
    $user_roles->delete;
    
    for my $role ( @roles ){
        $user->add_to_user_roles( { user_id => $user->uid, role_id => $role } );
    }
}

1;
