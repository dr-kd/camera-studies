package DataEntry::Controller::SpeciesBycatch;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'speciesbycatch';
1;
