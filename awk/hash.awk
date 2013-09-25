#!/usr/bin/env awk 

####
# awk 
####
BEGIN {
	n = (ARGV[1] < 1) ? 1 : ARGV[1];

	for (i = 1; i <= n; i++)
		x[sprintf("%x", i)] = i
	for (i = n; i > 0; i--)
		if (i in x)
		c++
		print c
}
