package DataEntry::Controller::FieldDetails;
use Moose;
BEGIN { extends 'DataEntry::ControllerBase::Table' };
__PACKAGE__->config->{action}->{start}->{PathPart} = 'fielddetails';
__PACKAGE__->config->{template_dir} = 'o2m';
1;
