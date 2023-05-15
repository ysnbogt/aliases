BEGIN {
    FS = "=";

    count = 0;
    function_name = "";
    description = "";

    print("<h1 align=\"center\">Aliases</h1>\n");

    print("| Name | Explanation or Command |");
    print("| ---- | ---------------------- |");
}

/^const\(\) \{$/ {
    next;
}

/^const [-a-z0-9]{1,}/ {
    sub(/^const /, "", $1);
    sub(/ {1,}$/, "", $1);
    sub(/^ /, "", $2);
    sub(/\|/, "\\|", $2);
    printf("| `%s` | `%s` |\n", $1, $2);
}

/^[a-z]{1,}\(\) \{$/, /^\}$/ {
    if ($0 ~ /^\}$/) {
        printf("| `%s()` | %s |\n", function_name, description);
        count = 0;
        next;
    }
    if (count == 0) {
        sub(/\(\) \{/, "", $0);
        function_name = $0;
    }
    if (count == 1) {
        sub(/    # /, "", $0);
        description = $0;
    }
    count += 1;
}
