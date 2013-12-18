#!/bin/bash - 
#===============================================================================
#
#          FILE: heredoc.sh
# 
#         USAGE: ./heredoc.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: DongYuezhao (Dolfly), dolfly@foxmail.com
#  ORGANIZATION: dongyuezhao.cn
#       CREATED: 2013年11月23日 15时32分34秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


#example 1: use cat

#1.1
str=teststr
cat >outfile <<EOF
	test1
	$str
EOF

#1.2
str=teststr2
cat <<EOF >outfile
	test2	
	$str
EOF


#example 2: use echo 

#2.1
echo <<EOF >outfile
	test3
EOF

#2.2
echo >outfile <<EOF
	test4
EOF
