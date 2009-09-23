package DataEntry::Controller::Camera;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'camera';
1;
