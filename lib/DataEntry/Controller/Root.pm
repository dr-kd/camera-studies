package DataEntry::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub index : Path Args(0) {
    my ($self, $c) = @_;
    $c->res->redirect('/studies')
}

sub do_404 : Path {
    my ($self, $c) = @_;
    $c->res->status(404);
    $c->res->body('page not found');
}

sub end : ActionClass('RenderView') {}

1;
