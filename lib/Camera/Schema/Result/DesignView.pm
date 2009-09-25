package Camera::Schema::Result::DesignView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('design_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    "select design.*, studies_design.study_id from design
    left outer join studies_design
    on studies_design.design_id = design.id and study_id=?
    order by study_id desc"
);


require Camera::Schema::Result::Design;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::Design->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::Design->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;

__END__

Other SQL


-- species_view
select species.*, studies_species.study_id from studies
       left join studies_species
       on species_id = studies_species.species_id
       and studies.id=1;

-- placement_view
select placement.*, studies_placement.study_id from studies
       left join studies_placement
       on placement_id = studies_placement.placement_id
       and studies.id=1;

-- field_view
select field.*, studies_field.study_id from studies
       left join studies_field
       on field_id = studies_field.field_id
       and studies.id=1;

-- camera_view
select camera.*, studies_camera.study_id from studies
       left join studies_camera
       on camera_id = studies_camera.camera_id
       and studies.id=1;

-- analy_view
select analy.*, studies_analy.study_id from studies
       left join studies_analy
       on analy_id = studies_analy.analy_id
       and studies.id=1;
