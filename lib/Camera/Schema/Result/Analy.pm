package Camera::Schema::Result::Analy;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("analy");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "analy_t",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "analy_n",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "studies_analies",
  "Camera::Schema::Result::StudiesAnaly",
  { "foreign.analy_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-23 14:10:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:L+urbuxIOUvO2Zel6FqJSQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
