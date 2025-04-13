sub notify_user {
    my ($user_type, $account_status) = @_;

    if ($user_type eq 'admin') {
        if ($account_status eq 'active') {
            return "Admin access granted.";
        } elsif ($account_status eq 'inactive') {
            return "Admin account inactive.";
        } else {
            return "Unknown admin status.";
        }
    }

    if ($user_type eq 'guest') {
        if ($account_status eq 'active') {
            return "Guest access granted.";
        } elsif ($account_status eq 'inactive') {
            return "Guest account inactive.";
        } else {
            return "Unknown guest status.";
        }
    }

    return "Unknown user type.";
}


print notify_user("admin", "active");     # "Admin access granted."
print notify_user("guest", "inactive");   # "Guest account inactive."
print notify_user("admin", "unknown");    # "Unknown admin status."
print notify_user("other", "active");     # "Unknown user type."
