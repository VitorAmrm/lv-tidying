sub process_data {
    my $input = shift;
    my @lines = split /\n/, $input;
    my @results;

    foreach my $line (@lines) {
        chomp($line);
        push @results, format_line($line);
    }

    return join("\n", @results);
}

sub format_line {
    my $line = shift;
    return ($line =~ /error/i) ? "Error: $line" : "OK: $line";
}



my $input = <<'END';
System started
Connection established
Error: disk not found
All services running
Unexpected error at line 42
END

print process_data($input)