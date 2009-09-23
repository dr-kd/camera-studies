package DataEntry::Controller::StudiesDetails;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesdetails';
1;
