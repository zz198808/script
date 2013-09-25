#!/usr/bin/env awk
BEGIN {
    delete ARGV;
    while (getline < "Usr.Dict.Words") {
    	dict[$0] = 1;
    }
}
{
    if (!dict[$1]) {
    	print $1
    }
}
