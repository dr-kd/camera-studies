package DataEntry::Controller::SpeciesMain;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'speciesmain';
1;
