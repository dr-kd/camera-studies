package Camera::Schema::Result::FieldView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('field_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
        "select field_details.*, studies_field.study_id from field_details
    left outer join studies_field
    on studies_field.field_id = field_details.id and studies_field.study_id=?
    order by study_id desc"

);


require Camera::Schema::Result::FieldDetails;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::FieldDetails->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::FieldDetails->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;
