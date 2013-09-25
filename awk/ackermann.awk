#!/usr/bin/env awk
###
# 非原始递归函数的例子。它需要两个自然数作为输入值，输出一个自然数。它的输出值增长速度非常高，仅是对于(4,3)的输出已大得不能准确计算
###
function ack(m, n) {
	if (m == 0) return( n + 1 );
	if (n == 0) return( ack(m - 1, 1) );
	return( ack(m - 1, ack(m, (n - 1))) );
}

BEGIN {
	n = (ARGV[1] < 1) ? 1 : ARGV[1];
	printf("Ack(3,%d): %d\n", n, ack(3, n));
	exit;
}
