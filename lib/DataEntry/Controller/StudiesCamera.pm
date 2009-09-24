package DataEntry::Controller::StudiesCamera;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiescamera';
1;
