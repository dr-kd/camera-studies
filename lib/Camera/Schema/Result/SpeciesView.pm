package Camera::Schema::Result::SpeciesView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('species_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
        "select species.*, studies_species.study_id from species
             left join studies_species
             on studies_species.species_id = id AND study_id = ?
             order by study_id desc"
);

require Camera::Schema::Result::Species;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::Species->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::Species->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;

