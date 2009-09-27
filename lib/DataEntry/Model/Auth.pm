package DataEntry::Model::Auth;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'DataEntry::Auth::Schema',
    
);

=head1 NAME

DataEntry::Model::Auth - Catalyst DBIC Schema Model
=head1 SYNOPSIS

See L<DataEntry>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<DataEntry::Auth::Schema>

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
