use utf8;
package WebRHINO::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

WebRHINO::Schema::Result::User

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

=head1 TABLE: C<user>

=cut

__PACKAGE__->table("user");

=head1 ACCESSORS

=head2 uid

  data_type: 'integer'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 username

  data_type: 'text'
  is_nullable: 0

=head2 password

  data_type: 'varchar'
  is_nullable: 0
  size: 128

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 last_name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 email

  data_type: 'varchar'
  is_nullable: 0
  size: 150

=cut

__PACKAGE__->add_columns(
  "uid",
  {
    data_type => "integer",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "username",
  { data_type => "text", is_nullable => 0 },
  "password",
  { data_type => "varchar", is_nullable => 0, size => 128 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "last_name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "email",
  { data_type => "varchar", is_nullable => 0, size => 150 },
);

=head1 PRIMARY KEY

=over 4

=item * L</uid>

=back

=cut

__PACKAGE__->set_primary_key("uid");


# Created by DBIx::Class::Schema::Loader v0.07043 @ 2015-10-27 17:50:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:etRotqr0mYFQLBTff6tZhg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
