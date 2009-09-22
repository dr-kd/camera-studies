package DataEntry::View::Web;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config(TEMPLATE_EXTENSION => '.tt',
                    WRAPPER => 'page.tt');

=head1 NAME

DataEntry::View::Web - TT View for DataEntry

=head1 DESCRIPTION

TT View for DataEntry. 

=head1 SEE ALSO

L<DataEntry>

=head1 AUTHOR

Kieren Diment

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
