package DataEntry;

use strict;
use warnings;
use Carp;
use Catalyst::Runtime 5.80;

use parent qw/Catalyst/;
use Catalyst qw/-Debug
                ConfigLoader
                Static::Simple
                Unicode
               /;
our $VERSION = '0.01';

__PACKAGE__->config( name => 'DataEntry' );

# Start the application
__PACKAGE__->setup();



1;
