package Camera::Schema::Result::SpeciesOtherView;
use warnings;
use strict;
use base qw/DBIx::Class/;
use Camera::Schema::Util;

my $util = Camera::Schema::Util->new;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('speciesother_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition( $util->join_view('species_other', 'studies', 'studies_speciesother', 'speciesother_id' ));

use Camera::Schema::Result::SpeciesOther;
use Camera::Schema::Result::Studies;

for my $col (Camera::Schema::Result::SpeciesOther->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::SpeciesOther->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );

1;
