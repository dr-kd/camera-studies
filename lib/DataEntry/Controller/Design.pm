package DataEntry::Controller::Design;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'design';
1;
