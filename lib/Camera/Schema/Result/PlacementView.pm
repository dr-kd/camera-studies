package Camera::Schema::Result::PlacementView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('placement_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    "select placement.* , studies_placement.study_id from placement
         left join studies_placement
         on placement_id = studies_placement.placement_id
         and studies_placement.study_id=?"
);


require Camera::Schema::Result::Placement;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::Placement->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::Placement->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;
