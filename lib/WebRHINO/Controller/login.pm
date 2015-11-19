package WebRHINO::Controller::login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

WebRHINO::Controller::login - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path ActionClass('REST') { }

sub index_GET {

    my ( $self, $c ) = @_;
    
    $c->stash( template => 'login.tt' );
}

sub index_POST {
    
    my ( $self, $c ) = @_;
    
    my $username = $c->request->params->{ username };
    my $password = $c->request->params->{ password };

    if ( $username && $password ) {

        if ( $c->authenticate({ username => $username, password => $password  } )) {
            $c->response->redirect( $c->uri_for( $c->controller('Root')->action_for('index') ) );
            return;
        } else {
            $c->stash( error => "Bad username or password." );
        }
    } else {
        $c->stash( error => "Empty username or password" )
            unless ( $c->user_exists );
    }
    
    $c->stash( template => 'login.tt' );
}


=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
