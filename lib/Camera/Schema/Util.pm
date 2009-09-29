package Camera::Schema::Util;
use Moose;

sub join_view {
    my ($self, $left, $right, $join, $fk) = @_;
    my $sql = qq{select $left.*, $join.study_id from $left
    left outer join $join
    on $join.$fk = $left.id and study_id = ?
    order by study_id desc
    };
    return $sql;
}

sub join_view_country {
    my ($self, $left, $right, $join, $fk) = @_;
    my $sql = qq{select $left.*, $join.study_id from $left
    left outer join $join
    on $join.$fk = $left.id and study_id = ?
    order by study_id desc, country
    };
    return $sql;
}


__PACKAGE__->meta->make_immutable;
1;
