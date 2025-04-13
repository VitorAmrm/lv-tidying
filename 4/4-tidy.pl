use constant UNKNOWN_TYPE => "Unknown user type.";

sub notify_user {
    my ($user_type, $account_status) = @_;

    if(!($user_type eq 'admin') && !($user_type eq 'guest')) {
        return UNKNOWN_TYPE;
    }

    if (!($account_status eq 'inactive') && !($account_status eq 'active')) {
        return notify_unknown_status($user_type);
    }

    if($account_status eq 'inactive') {
        return notify_inactive($user_type);
    }

    return notify_granted($user_type);
}

sub notify_inactive {
    return ucfirst(shift) . " account inactive.";
}

sub notify_granted {
    return ucfirst(shift) . " access granted.";
}

sub notify_unknown_status {
    return "Unknown " . shift . " status.";
}


print notify_user("admin", "active");     # "Admin access granted."
print notify_user("guest", "inactive");   # "Guest account inactive."
print notify_user("admin", "unknown");    # "Unknown admin status."
print notify_user("other", "active");     # "Unknown user type."
