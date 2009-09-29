package Camera::Schema::Result::StudyCountry;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("study_country");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "country",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "studies_countries",
  "Camera::Schema::Result::StudiesCountries",
  { "foreign.country_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-26 18:43:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Xol3p9jyQhi7ruo9pQL6FQ

__PACKAGE__->has_many(
  "studies_countries",
  "Camera::Schema::Result::StudiesCountries",
  { "foreign.countries_id" => "self.id" },
);


# You can replace this text with custom content, and it will be preserved on regeneration
1;
