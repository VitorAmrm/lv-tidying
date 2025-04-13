sub process_numbers {
    my @numbers = @_;
    my @positive_numbers;

    foreach my $number (@numbers) {
        if ($number > 0) {
            push @positive_numbers, $number;
        }
    }

    my @doubled_numbers;
    foreach my $number (@positive_numbers) {
        my $doubled = $number * 2;
        push @doubled_numbers, $doubled;
    }

    return @doubled_numbers;
}
