package Camera::Schema::Result::SpeciesMainView;
use warnings;
use strict;
use base qw/DBIx::Class/;
use Camera::Schema::Util;

my $util = Camera::Schema::Util->new;

__PACKAGE__->load_components('Core');
__PACKAGE__->table_class('DBIx::Class::ResultSource::View');
__PACKAGE__->table('speciesmain_view');
__PACKAGE__->result_source_instance->is_virtual(1);
__PACKAGE__->result_source_instance->view_definition( $util->join_view('species_main', 'studies', 'studies_speciesmain', 'speciesmain_id' ));

use Camera::Schema::Result::SpeciesMain;
use Camera::Schema::Result::Studies;

for my $col (Camera::Schema::Result::SpeciesMain->columns) {
    __PACKAGE__->add_column($col => Camera::Schema::Result::SpeciesMain->column_info($col) );
}
__PACKAGE__->table (__PACKAGE__->table ); # wtf?
__PACKAGE__->add_column(study_id => Camera::Schema::Result::Studies->column_info('id') );

1;
