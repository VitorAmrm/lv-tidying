sub process_data {
    my $input = shift;
    my @lines = split /\n/, $input;
    my @results;
    foreach my $line (@lines) {
        chomp($line);
        if ($line =~ /error/i) {
            push @results, "Error: $line";
        } else {
            push @results, "OK: $line";
        }
    }
    return join("\n", @results);
}

my $input = <<'END';
System started
Connection established
Error: disk not found
All services running
Unexpected error at line 42
END

print process_data($input)