#!/bin/bash - 
#===============================================================================
#
#          FILE: sendmail.sh
# 
#         USAGE: ./sendmail.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: DongYuezhao (Dolfly), dolfly@foxmail.com
#  ORGANIZATION: dongyuezhao.cn
#       CREATED: 2013/09/26 22时16分38秒 CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
FROM="dongyuezhao@sogou-inc.com"
#FROM="dolfly@163.com"
TO="douningbo@sogou-inc.com,249300797@qq.com,121317704@qq.com"

CC="dongyuezhao@sogou-inc.com"
#TO="dolfly@foxmail.com"
BCC="dolfly@163.com"


function usage(){
	echo "usage: ${0} <SUBJECT> <CONTENT>"
	exit 1
}

if [[ $# -lt  2 ]] ; then
	usage
fi

SUBJECT="$1"
CONTENT="$2"

SENDMAIL_CMD=`type -path sendmail`

[ -x "${SENDMAIL_CMD}" ] || { echo "sendmail is not exists";exit 2; }

${SENDMAIL_CMD} -t <<EOF
From: ${FROM}
To: ${TO}
Cc: ${CC}
#Bcc: ${BCC} 
Subject: ${SUBJECT}                                                 
---------------------------------                                      
${CONTENT}
---------------------------------
EOF
