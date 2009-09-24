package DataEntry::Controller::StudiesAnaly;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesanaly';
1;
