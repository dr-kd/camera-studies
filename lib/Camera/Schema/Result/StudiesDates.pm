package Camera::Schema::Result::StudiesDates;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_dates");
__PACKAGE__->add_columns(
  "date_id",
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
__PACKAGE__->set_primary_key("study_id", "date_id");
__PACKAGE__->belongs_to(
  "date_id",
  "Camera::Schema::Result::StudiesDates",
  { id => "date_id" },
);
__PACKAGE__->has_many(
  "studies_dates",
  "Camera::Schema::Result::StudiesDates",
  { "foreign.date_id" => "self.id" },
);
__PACKAGE__->belongs_to(
  "study_id",
  "Camera::Schema::Result::Studies",
  { id => "study_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-26 18:43:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7YoJgouw0qclsZAa72uSDA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
