package DataEntry::ControllerBase::Table;
use Moose;
BEGIN { extends 'Catalyst::Controller'};
__PACKAGE__->config->{template_dir} = 'base';

sub start : Chained PathPart('table') CaptureArgs(0) {
   my ( $self, $c ) = @_;
   my @controllers = $c->controller(qr{^(?!Root)});
   $_ = $_->action_namespace for @controllers;
   $c->stash(
       namespace => $c->namespace,
       labels => $c->model('DB::Labels')->labels,
       controllers => \@controllers,
       );
}

sub default : Chained('start') PathPart('') Args(0) {
   my ( $self, $c ) = @_;
   return $self->do_list($c);
}

sub list : Chained('start') PathPart('list') Args(0) {
   my ( $self, $c ) = @_;
   $c->forward('do_list');
}

sub do_list :Private {
   my ( $self, $c ) = @_;
   my $table = ucfirst($c->namespace);
   $c->stash( page =>  $c->req->query_parameters->{page} || 1);
   my $studies = $c->model("DB::$table")->search({}, {rows => 20, page => $c->stash->{page}});
   $c->stash( studies => $studies,
              template => $self->config->{template_dir} . '/list.tt' );
}

sub make_new : Chained('start') PathPart('do_edit') Args(0) {
    my ($self, $c) = @_;
    $c->forward('do_edit');
}

sub create : Chained('start') PathPart('add') Args(0) {
   my ( $self, $c ) = @_;
   my $table = ucfirst($c->namespace);
   $c->stash( s => $c->model("DB::$table")->new_result({}) );
   $c->stash( template => $self->config->{template_dir} . '/edit.tt');
}

sub import : Chained('start') PathPart('import') Args(0) {
    my ($self, $c) = @_;
    $c->stash(template => 'base/import.tt');
}

sub do_import : Chained('start') PathPart('do_import') Args(0) {
    my ($self, $c) = @_;
    my $upload = $c->req->upload('xls');
    my $csv = $upload->slurp;
    my $table = ucfirst($c->namespace);
    $c->model("DB::$table")->import_data($csv);
    $c->res->redirect('/' .$c->namespace);
}

sub item : Chained('start') PathPart('') CaptureArgs(1)
{
   my ( $self, $c, $id ) = @_;
   my $table = ucfirst($c->namespace);
   $c->stash( s => $c->model("DB::$table")->find($id),
          );
}

sub edit : Chained('item') PathPart('edit') Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( template => $self->config->{template_dir} . '/edit.tt');
}

sub do_edit : Chained('item') PathPart('do_edit') Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->req->params;
    my $return_id = $params->{source_id};
    if ($c->namespace =~ /^(results|extra|fielddetails)$/) {
        $params->{study_id} = $return_id;
    }
    delete $params->{source_id};
    my $table_class = $params->{actionclass};
    delete $params->{actionclass};
    $table_class =~ s/DataEntry::Controller:://;
    $c->model("DB::$table_class")->create($params);
    $c->res->redirect($c->uri_for('/studies', $return_id, 'edit'));
}

sub remove : Chained('item') PathPart('delete') Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{"s"}->delete();
    $c->res->redirect($c->req->referer);
}


sub get_rels {
    my ($self, $tbl) = @_;
    return {
        'Analy' => [qw/ StudiesAnaly analy_id/],
        'Camera' => [qw/StudiesCamera camera_id /],
        'Design' => [qw/StudiesDesign design_id /],
        'Extra' => [qw/StudiesExtra extra_id /],
        'FieldDetails' => [qw/ StudiesField field_id /],
        'Placement' => [qw/StudiesPlacement placement_id /],
        'SpeciesBycatch' => [qw/StudiesSpeciesbycatch speciesbycatch_id /],
        'SpeciesMain' => [qw/StudiesSpeciesmain speciesmain_id /],
        'SpeciesOther' => [qw/StudiesSpeciesOther speciesother_id /],
        'StudyCountry' => [qw/StudiesCountries country_id /],
        'StudyDates' => [qw/ StudiesDates date_id /],
        'StudyRegion' => [qw/StudiesRegion region_id /],
    };
}

1;
