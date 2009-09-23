package DataEntry::Controller::StudiesField;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studiesfield';
1;
