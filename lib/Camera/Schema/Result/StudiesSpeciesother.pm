package Camera::Schema::Result::StudiesSpeciesother;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_speciesother");
__PACKAGE__->add_columns(
  "study_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "speciesother_id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("study_id", "speciesother_id");
__PACKAGE__->belongs_to(
  "study_id",
  "Camera::Schema::Result::Studies",
  { id => "study_id" },
);
__PACKAGE__->belongs_to(
  "speciesother_id",
  "Camera::Schema::Result::SpeciesOther",
  { id => "speciesother_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 19:52:59
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:n2pBG+4E0mxJt3YdNnQfXw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
