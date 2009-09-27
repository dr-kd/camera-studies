package DataEntry::Auth::Schema::Role;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("EncodedColumn", "Core");
__PACKAGE__->table("role");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INTEGER",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "role",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("role_unique", ["role"]);
__PACKAGE__->has_many(
  "user_roles",
  "DataEntry::Auth::Schema::UserRole",
  { "foreign.roleid" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 22:17:22
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IYk/M5R+RBfZNkQXmvfffQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
