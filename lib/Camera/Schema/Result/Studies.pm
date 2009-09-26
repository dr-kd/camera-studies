package Camera::Schema::Result::Studies;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("studies");
__PACKAGE__->add_columns(
  "id",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "citat",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "auth_c",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "year",
  {
    data_type => "integer",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "auth_all",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "abst",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "link",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "title",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "journ",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "publ",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "vol",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "issu",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "page",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "userid",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
  "done",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->has_many(
  "studies_details",
  "Camera::Schema::Result::StudiesDetails",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_placements",
  "Camera::Schema::Result::StudiesPlacement",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_designs",
  "Camera::Schema::Result::StudiesDesign",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_cameras",
  "Camera::Schema::Result::StudiesCamera",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_analies",
  "Camera::Schema::Result::StudiesAnaly",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_dates",
  "Camera::Schema::Result::StudiesDates",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_countries",
  "Camera::Schema::Result::StudiesCountries",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_regions",
  "Camera::Schema::Result::StudiesRegion",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_speciesmains",
  "Camera::Schema::Result::StudiesSpeciesmain",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_speciesothers",
  "Camera::Schema::Result::StudiesSpeciesother",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "studies_speciesbycatches",
  "Camera::Schema::Result::StudiesSpeciesbycatch",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "results",
  "Camera::Schema::Result::Results",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "field_details",
  "Camera::Schema::Result::FieldDetails",
  { "foreign.study_id" => "self.id" },
);
__PACKAGE__->has_many(
  "extras",
  "Camera::Schema::Result::Extra",
  { "foreign.study_id" => "self.id" },
);


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-09-26 18:43:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/m6Fjzplisj28pJSBJEgBQ

1;
