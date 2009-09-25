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
   my $studies = $c->model("DB::$table")->search({});
   $c->stash( studies => $studies,
              template => $self->config->{template_dir} . '/list.tt' );
}

sub create : Chained('start') PathPart('add') Args(0) {
   my ( $self, $c ) = @_;
   # Create the empty book row for the form
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
   $DB::single=1;
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
    $c->stash( template => $self->config->{template_dir} . '/do_edit.tt');
}

1;
