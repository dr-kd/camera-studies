package Camera::Schema::Result::StudiesDates;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies_dates");
__PACKAGE__->add_columns(
  "dates_id",
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
__PACKAGE__->set_primary_key("study_id", "dates_id");
__PACKAGE__->belongs_to(
  "dates_id",
  "Camera::Schema::Result::StudiesDates",
  { id => "dates_id" },
);
__PACKAGE__->has_many(
  "studies_dates",
  "Camera::Schema::Result::StudiesDates",
  { "foreign.dates_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-27 21:57:42
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KYHuY0+O5HmuAePhVfrMHw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
