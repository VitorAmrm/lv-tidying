sub generate_report {
    my ($name, $score) = @_;

    my $greeting = "Hello " . $name . "!";
    my $status;

    if ($score >= 90) {
        $status = "Excellent";
    } elsif ($score >= 75) {
        $status = "Good";
    } elsif ($score >= 60) {
        $status = "Satisfactory";
    } else {
        $status = "Needs Improvement";
    }

    return $greeting . " Your score is $score. Performance: $status.";
}

print generate_report("Alice", 87);
# "Hello Alice! Your score is 87. Performance: Good."
