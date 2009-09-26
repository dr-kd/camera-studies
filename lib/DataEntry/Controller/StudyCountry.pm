package DataEntry::Controller::StudyCountry;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studycountry';
1;
