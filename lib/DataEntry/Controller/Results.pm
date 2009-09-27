package DataEntry::Controller::Results;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'results';
__PACKAGE__->config->{template_dir} = 'o2m';
1;
