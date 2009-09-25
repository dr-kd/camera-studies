package Camera::Schema::Result::AnalyView;
use base qw/DBIx::Class/;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');

__PACKAGE__->table('analy_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition(
"select analy.*, studies_analy.study_id from analy
    left outer join studies_analy
    on studies_analy.analy_id = analy.id
    where studies_analy.study_id=?
    or studies_analy.study_id is null order by study_id desc"

);


require Camera::Schema::Result::Analy;
require Camera::Schema::Result::Studies;
for my $col (Camera::Schema::Result::Analy->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::Analy->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );




1;
