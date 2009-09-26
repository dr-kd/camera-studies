package DataEntry::Controller::StudyDates;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studydates';
1;
