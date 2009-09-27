package DataEntry::Controller::Extra;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'extra';
__PACKAGE__->config->{template_dir} = 'o2m';
1;
