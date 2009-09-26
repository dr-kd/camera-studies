package DataEntry::Controller::SpeciesOther;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'speciesother';
1;
