package Camera::Schema::Result::StudiesField;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_field");
__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "field_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("study_id", "field_id");
__PACKAGE__->belongs_to(
  "study_id",
  "Camera::Schema::Result::Studies",
  { id => "study_id" },
);
__PACKAGE__->belongs_to(
  "field_id",
  "Camera::Schema::Result::FieldDetails",
  { id => "field_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-23 14:10:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UZnm8odhSTr8v7tToFxIzA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
