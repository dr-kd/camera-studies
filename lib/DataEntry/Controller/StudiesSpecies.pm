package DataEntry::Controller::StudiesSpecies;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesspecies';
1;
