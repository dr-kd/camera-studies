package DataEntry::Controller::StudiesDetails;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesdetails';
1;
