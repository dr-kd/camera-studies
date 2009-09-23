package DataEntry::Controller::Results;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'results';
1;
