package Camera::Schema::Result::StudiesDesign;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_design");
__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "design_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("study_id", "design_id");
__PACKAGE__->belongs_to(
  "study_id",
  "Camera::Schema::Result::Studies",
  { id => "study_id" },
);
__PACKAGE__->belongs_to(
  "design_id",
  "Camera::Schema::Result::Design",
  { id => "design_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-26 18:43:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ELuAMwAENS/584uj48SQXQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
