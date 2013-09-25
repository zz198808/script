#!/usr/bin/env awk
BEGIN {
    delete ARGV;
    FS = "[^A-Za-z][^A-Za-z]*";
}
{
    for (i=1; i<=NF; i++) {
    freq[tolower($(i))]++;
    }
}
END {
    # gawk doesn't have a builtin sort routine
    # so we have to pipe through the shell sort program
    sort = "/bin/sort -nr"
    for (word in freq) {
		if (word) {
			printf "%7d\t%s\n", freq[word], word | sort
		}
    }
    close(sort)
}
