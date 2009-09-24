package DataEntry::Controller::StudiesDesign;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesdesign';
1;
