package WebRHINO::Controller::admin;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

WebRHINO::Controller::admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


sub auto :Private {
    my ( $self, $c ) = @_;
    
    if ( !$c->check_user_roles('Admin') ){
        $c->response->redirect( '/' );
        return 0;
    }

    return 1;
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
