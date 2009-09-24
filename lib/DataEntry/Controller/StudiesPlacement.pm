package DataEntry::Controller::StudiesPlacement;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesplacement';
1;
