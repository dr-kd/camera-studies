#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
my $csv = Text::CSV_XS->new;
use YAML;
use Smart::Comments;
use FindBin qw/$Bin/;
use lib "$Bin/../lib";
use Camera::Schema;
my $schema = Camera::Schema->connect("dbi:SQLite:dbname=alex.db",'','');
# perl dedup.pl analy.csv Analy analy_t analy_n StudiesAnaly study_id

my ($file, $table, $field1, $field2, $join_table, $join_field) = @ARGV;


open my ($FH), $file;
while (<$FH>) {
   chomp;
   next if ($. == 1);
   $csv->parse($_);
   my @row = $csv->fields;
   my %from;
   my %to;
   %from = (id => $row[0],
         $field1 => $row[1],
        $field2 => $row[2]);
   %to = ( id => $row[3],
           $field1 => $row[4],
           $field2 => $row[5],
       );
   my $rs = $schema->resultset($table)->search({id => $from{id}});
   if ($_ =~ /DELETE/) { ### Delete record
       ### deleting:$from{id}
       my $joinrs = $schema->resultset($join_table)->search({$join_field => $from{id}});
       while (my $j = $joinrs->next) {   ### Delete orphans
           $j->delete
       }
       ### Delete main record.
       my $rec = $schema->resultset($table)->search({id => $from{id}})->delete;
   }
   else {
       my $rec = $rs->first;
       # is it first col or second col?
       if ($to{$field1} eq '') {
           move_record($rec, $field1, $to{$field1}, $join_table, $join_field);
       }
       elsif ($to{$field2} eq '') {
           move_record($rec, $field2, $to{$field1}, $join_table, $join_field);
       }
   }
}
       1;


sub move_record {
    my ($rec, $field, $newval, $join_tbl, $join_field) = @_;
    # $rec->$field($newval);
    my $id = $rec->id;
    my $join_rs = $rec->result_source->schema
        ->resultset($join_tbl)->search({$join_field => $id});
    if ($join_rs->count == 0) {
        ### delete orphan
        $rec->delete;
    }
    elsif ($join_rs->count == 1) {
        ### do nothing
    }
    elsif ($join_rs->count > 1) {
        ### update join table
        $join_rs->update({$join_field => $id});
    }
    $rec->update;
    $join_rs->update;
}

__END__

=head1 schema details

CREATE TABLE design (
id integer primary key,
study_t text,
objecti text
);

CREATE TABLE studies_design (
study_id integer references studies(id),
design_id integer references design(id),
primary key (study_id, design_id)
);


CREATE TABLE analy (
id integer primary key,
analy_t text,
analy_n text
);

study_id integer references studies(id),
analy_id integer references analy(id),
primary key (study_id, analy_id)
);


=cut
