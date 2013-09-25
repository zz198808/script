#!/usr/bin/env awk

#####
#  awk 数组的例子
#####
BEGIN {
	n = (ARGV[1] < 1) ? 1 : ARGV[1];

	for (i = 0; i < n; i++)
		x[i] = i + 1
	for (k = 0; k < 1000; k++) {
		for (j = n-1; j >= 0; j--)
			y[j] += x[j]
	}

	print y[0], y[n-1]
}
