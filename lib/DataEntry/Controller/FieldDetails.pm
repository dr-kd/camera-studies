package DataEntry::Controller::FieldDetails;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'fielddetails';
1;
