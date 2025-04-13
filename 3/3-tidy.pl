use constant DOUBLE => 2;

sub process_numbers {
    my @numbers = @_;

    my %number_doubled_map = map { $_ => $_ * DOUBLE } grep { $_ > 0 } @numbers;

    return %number_doubled_map;
}
