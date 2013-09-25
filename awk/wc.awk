#!/usr/bin/env awk 

#####
# awk 实现 wc 的功能
#
# usage :
# awk -f wc.awk < file
# cat file | awk -f wc.awk
#####

BEGIN { delete ARGV }
{
	nc += length($0) + 1
	nw += NF
}
END { print NR, nw, nc }
