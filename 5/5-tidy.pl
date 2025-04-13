use constant NEED_IMPROVEMENT => "Needs Improvement";
use constant EXCELLENT => "Excellent";
use constant GOOD => "Good";
use constant SATISFACTORY => "Satisfactory";

my $format = sub {
    my ($greeting, $score) = @_;
    my $status = generate_status($score);
    return $greeting . " Your score is $score. Performance: $status.";
};

sub generate_report {
    my ($name, $score) = @_;

    my $greeting = "Hello " . $name . "!";
    return $format->($greeting, $score);
}

sub generate_status {
    my $score = shift;

    if ($score >= 90) {
        return EXCELLENT;
    } elsif ($score >= 75) {
       return GOOD;
    } elsif ($score >= 60) {
        return SATISFACTORY;
    } else {
        return NEED_IMPROVEMENT;
    }
}

print generate_report("Alice", 87);
print generate_report("Jonh", 55);
print generate_report("Rintter", 73);
# "Hello Alice! Your score is 87. Performance: Good."
