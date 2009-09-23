package DataEntry::Controller::Studies;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'studies';
__PACKAGE__->config->{template_dir} = 'studies';
1;
