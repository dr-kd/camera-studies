package DataEntry::Controller::Studies;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studies';
__PACKAGE__->config->{template_dir} = 'studies';

sub item : Chained('start') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $c->stash(
        s => $c->model("DB::Studies")->find($id),
        details => $c->model('DB::DetailsView')->search_rs({}, { bind => [ $id ] }),
        species => $c->model('DB::SpeciesView')->search_rs({}, { bind => [ $id ] }),
        placement => $c->model('DB::PlacementView')->search_rs({}, { bind => [ $id ] }),
        field => $c->model('DB::FieldView')->search_rs({}, { bind => [ $id ] }),
        design => $c->model('DB::DesignView')->search_rs({}, { bind => [ $id ] }),
        camera => $c->model('DB::CameraView')->search_rs({}, { bind => [ $id ] }),
        analy => $c->model('DB::AnalyView')->search_rs({}, { bind => [ $id ] }),
        results => $c->model('DB::Results')->search_rs({}),
        extras => $c->model('DB::Extra')->search_rs({}),
    );
    $DB::single=1;
    warn "leaving controller";
}

1;
