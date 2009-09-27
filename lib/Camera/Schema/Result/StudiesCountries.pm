package Camera::Schema::Result::StudiesCountries;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_countries");
__PACKAGE__->add_columns(
  "countries_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("countries_id", "study_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 21:42:24
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9Gd9FkpBEM1/lc+GoxD7Yg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
