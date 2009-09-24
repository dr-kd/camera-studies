package Camera::Schema::Result::CameraView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('camera_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
    "select camera.* , studies_camera.study_id from camera
         left join studies_camera
         on camera_id = studies_camera.camera_id
         and studies_camera.study_id=?"
);


require Camera::Schema::Result::Camera;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::Camera->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::Camera->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;
