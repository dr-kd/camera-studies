package Camera::Schema::ResultSet;
use parent 'DBIx::Class::ResultSet';
use warnings;
use strict;
use Text::CSV::Encoded  coder_class => 'Text::CSV::Encoded::Coder::EncodeGuess';
use Text::Demoroniser qw(demoroniser_utf8);

sub import_data {
    my ($self, $data) = @_;
    $data = demoroniser_utf8($data);
    $DB::single=1;
    my @data = split /\r?\n/, $data;
    my $head =  lc($data[0]);
    my $csv = Text::CSV::Encoded->new;
    $csv->parse($head);
    my @head = $csv->fields;
    my @cols = $self->result_source->columns;
    my %cols;
    $cols{$_} = '' for @cols;
    delete($cols{id});
    my $error;
    foreach my $c (@head) {
        unless (exists ($cols{$c})) {
            $error = $error . " required column $c missing from csv file\n"
        }
    }
    die "$error" if $error;
    foreach my $r ( @data[1 .. $#data] ) {
        $csv->parse($r);
        my @row = $csv->fields;
        my %rowdata;
        @rowdata{@head} = @row;
        $self->create(\%rowdata);
    }
}

1;
