use utf8;
package WebRHINO::Schema::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

WebRHINO::Schema::Result::Role

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<role>

=cut

__PACKAGE__->table("role");

=head1 ACCESSORS

=head2 roleid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 role

  data_type: 'varchar'
  is_nullable: 0
  size: 25

=cut

__PACKAGE__->add_columns(
  "roleid",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "role",
  { data_type => "varchar", is_nullable => 0, size => 25 },
);

=head1 PRIMARY KEY

=over 4

=item * L</roleid>

=back

=cut

__PACKAGE__->set_primary_key("roleid");

=head1 RELATIONS

=head2 user_roles

Type: has_many

Related object: L<WebRHINO::Schema::Result::UserRole>

=cut

__PACKAGE__->has_many(
  "user_roles",
  "WebRHINO::Schema::Result::UserRole",
  { "foreign.role_id" => "self.roleid" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: many_to_many

Composing rels: L</user_roles> -> user

=cut

__PACKAGE__->many_to_many("users", "user_roles", "user");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-12-17 17:38:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C5gdXkpYR8yVNqHPzhZ/XQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
