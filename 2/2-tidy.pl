use constant ADMIN_CONST => 1;
use constant NORMAL_USER_CONST => 0;

sub check_name {
    my $name = shift;

    # Verificação clara de string vazia
    return NORMAL_USER_CONST if $name eq "";

    return $name eq "admin" ? ADMIN_CONST : NORMAL_USER_CONST;
}

sub greet_user {
    my $name = shift;
    if (check_name($name) == ADMIN_CONST) {
        return greet_admin_user($name)
    }
    return greet_normal_user($name);
}

sub greet_admin_user {
    return "Hello " . shift . ", you have admin access.";
}

sub greet_normal_user {
    return "Hello " . shift
}