package DataEntry::Controller::Studies;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studies';
__PACKAGE__->config->{template_dir} = 'studies';

use URI;

sub item : Chained('start') PathPart('') CaptureArgs(1) {
    my ($self, $c, $id) = @_;
    $c->stash(
        id => $id,
        s => $c->model("DB::Studies")->find($id),
        placement => $c->model('DB::PlacementView')->search_rs({}, { bind => [ $id] }),
        field => $c->model('DB::FieldDetails')->search_rs({study_id => $id}),
        design => $c->model('DB::DesignView')->search_rs({}, { bind => [ $id] }),
        speciesbycatch => $c->model('DB::SpeciesBycatchView')->search_rs({}, { bind => [ $id] }),
        speciesother => $c->model('DB::SpeciesOtherView')->search_rs({}, { bind => [ $id] }),
        speciesmain => $c->model('DB::SpeciesMainView')->search_rs({}, { bind => [ $id] }),
        country => $c->model('DB::StudyCountryView')->search_rs({}, { bind => [ $id] }),
        dates => $c->model('DB::StudyDatesView')->search_rs({}, { bind => [ $id] }),
        region => $c->model('DB::StudyRegionView')->search_rs({}, { bind => [ $id] }),
        details => $c->model('DB::StudyDetailsView')->search_rs({}, { bind => [ $id] }),
        camera => $c->model('DB::CameraView')->search_rs({}, { bind => [ $id] }),
        analy => $c->model('DB::AnalyView')->search_rs({}, { bind => [ $id] }),
        results => $c->model('DB::Results')->search_rs({study_id => $id}),
        extras => $c->model('DB::Extra')->search_rs({study_id => $id}),
    );
}

sub do_edit : Chained('item') PathPart('do_edit') Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->req->params;
    my $study_id = $params->{id};
    my $parent_tbl = {};
    my $children = {};
    my $dest;
    foreach my $k ( keys %$params) {
        if ($k =~ /^http/) {
            $dest = $k;
            next;
        }
        elsif (ref($params->{$k}) eq 'ARRAY') {
            $children->{$k} =$params->{$k}
        }
        else {
            $parent_tbl->{$k} = $params->{$k}
        }
    }
    my $rec = $c->model('DB::Studies')->find($study_id);
    delete $parent_tbl->{id};
    $rec->update($parent_tbl);
    foreach my $k (keys %$children) {
        next if $k =~ /^(Extra|Results)$/;
        my $fk_rec = lc($k);
        $fk_rec =~ s/studies//;
        $fk_rec = $fk_rec."_id";
        foreach my $child_id ( @ {$children->{$k}}) {
            next if $child_id eq 'del';
            my $rec = { study_id => $study_id,
                        $fk_rec => $child_id,
                    };
            $DB::single=1;
            $c->model("DB::$k")->find_or_create($rec);
        }
    }
    # deal with extra and results here
    if ($dest) {
        my ($to, $return) = split '\|\|', $dest;
        $to = URI->new($to);
        $to->query_form(orig_id => $study_id);
        $c->res->redirect($to);
        return 1;
    }
    # go to subtable page if relevant param is present
    $study_id++;
    # $c->stash( template => $self->config->{template_dir} . '/do_edit.tt');
    $c->res->redirect($c->uri_for("/studies/$study_id/edit"));
}


1;
