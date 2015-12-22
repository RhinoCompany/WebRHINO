package WebRHINO::Controller::admin::user;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

WebRHINO::Controller::admin::user - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched WebRHINO::Controller::admin::user in admin::user.');
}

sub add :Local :Args(0) :ActionClass('REST') { }

sub add_GET {
    my ( $self, $c ) = @_;

    # Vou instanciar um objeto que herda a tabela role do banco de dados
    # O $c->model chama o model Rhino, e a tabela Role dentro dele:
    my $role_rs = $c->model('Rhino::Role');

    # Agora vou criar uma lista com todos os registros da tabela role:
    my @roles = $role_rs->all();
    # Esse comando acima gera o SQL: "SELECT * FROM role;"

    $c->stash({ 
        # Vou passar a lista de roles para a pagina ( template )
        # Na pagina, vou conseguir chamar essa lista pelo nome 'roles'
        # O nome para a pagina fica do lado esquerdo do hash
        roles    => \@roles,
        template => 'admin/user/add.tt'
    });
}

sub add_POST {
    my ( $self, $c ) = @_;

    my $role_rs = $c->model('Rhino::Role');
    my $user_rs = $c->model('Rhino::User');

    # Vou receber todos os parametros que a pagina me passou aqui
    my $first_name   = $c->req->param('fname');
    my $last_name    = $c->req->param('lname');
    my $user_name    = $c->req->param('uname');
    my $email        = $c->req->param('email');
    my $password     = $c->req->param('passwd');
    my $password_chk = $c->req->param('passwdchk');
    my $role         = $c->req->param('role');

    # Preciso checar se o usuário ja existe.
    # Eu podia usar a função 'exists' do User.pm
    # Que fica na pasta ResultSet, dentro de Schema
    # Mas para demonstrar, vou fazer por aqui:
    my $user = $user_rs->find({ username => $user_name });
    # O comando acima gera o SQL: SELECT * FROM user WHERE username = 'user.example';
    # O find procura por apenas UM registro, e retorna o objeto ResultClass
    # O search procura por mais de um registro, e retorna uma lista de ResultClass,
    # Ou um ResultSet, em contexto de scalar '$', nesse caso se quiser os resultados,
    # Usar uma lista para receber os resultados '@'
    # Mais informações: http://search.cpan.org/dist/DBIx-Class/lib/DBIx/Class/ResultSet.pm


    if ( ! $user ) { # Se usuário não existe no banco de dados
        if( $password eq $password_chk ) {
            # Aqui vou criar um usuário novo, usando a função do User.pm
            # Que encontra-se na pasta ResultSet, dentro do Schema
            my $arguments = {
                first_name => $first_name,
                last_name  => $last_name,
                username   => $user_name,
                email      => $email,
                password   => $password,
                role       => $role,
            };

            $user_rs->new_user( $arguments );

            $c->stash->{ success } = "Usuario criado com sucesso!";
        }
        else {
            $c->response->code(406);
            $c->stash->{ error } = "As senhas nao coincidem. Favor tentar novamente.";
        }
    }
    else {
        $c->response->code(406);
        $c->stash->{ error } = "O usuario ja esta cadastrado. Favor checar e tentar novamente.";
    }

    my @roles = $role_rs->all();
    # Esse comando acima gera o SQL: "SELECT * FROM role;"

    $c->stash({ 
        # Vou passar a lista de roles para a pagina ( template )
        # Na pagina, vou conseguir chamar essa lista pelo nome 'roles'
        # O nome para a pagina fica do lado esquerdo do hash
        roles    => \@roles,
        template => 'admin/user/add.tt'
    });
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
