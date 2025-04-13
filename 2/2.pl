sub check_name {
    my $name = shift;
    if (length($name) > 0) {
        if ($name eq "admin") {
            return 1;
        }
    }
    return 0;
}

sub greet_user {
    my $name = shift;
    my $greeting = "Hello " . $name;
    if (check_name($name)) {
        $greeting .= ", you have admin access.";
    }
    return $greeting;
}
