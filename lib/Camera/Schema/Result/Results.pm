package Camera::Schema::Result::Results;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("results");
__PACKAGE__->add_columns(
  "id",
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
  "tot_n",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "tr_n",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "targ_no",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "tot_no",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "tot_im",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "mis",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "ph_rate",
  { data_type => "", default_value => undef, is_nullable => 1, size => undef },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->belongs_to(
  "study_id",
  "Camera::Schema::Result::Studies",
  { id => "study_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-26 18:43:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8i7963CiOErDwSi3+okYSA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
