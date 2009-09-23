package DataEntry::Controller::StudyDetails;
use warnings;
use strict;
use parent 'DataEntry::ControllerBase::Table';
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studydetails';
1;
