package DataEntry::Controller::Studies;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studies';
__PACKAGE__->config->{template_dir} = 'studies';

sub item : Chained('start') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $c->stash(
        s => $c->model("DB::Studies")->find($id),
        details => $c->model('DB::DetailsView')->search({}, { bind => [ $id ] }),
        species => $c->model('DB::SpeciesView')->search({}, { bind => [ $id ] }),
        placement => $c->model('DB::PlacementView')->search({}, { bind => [ $id ] }),
        field => $c->model('DB::FieldView')->search({}, { bind => [ $id ] }),
        design => $c->model('DB::DesignView')->search({}, { bind => [ $id ] }),
        camera => $c->model('DB::CameraView')->search({}, { bind => [ $id ] }),
        analy => $c->model('DB::AnalyView')->search({}, { bind => [ $id ] }),
        results => $c->model('DB::Results')->search({}),
        extras => $c->model('DB::Extra')->search({}),
    );
}

1;
