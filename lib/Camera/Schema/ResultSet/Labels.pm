package Camera::Schema::ResultSet::Labels;
use parent 'DBIx::Class::ResultSet';
use warnings;
use strict;

sub labels {
    my ($self) = @_;
    my %labels;
    my $rs = $self->search({});
    while ( my $r = $rs->next) {
        $labels{$r->label} = $r->label_text;
    }
    return \%labels;
}

1;
