package DataEntry::Controller::FieldDetails;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'fielddetails';
1;
