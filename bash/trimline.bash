#!/bin/bash

SCRIPT_NAME=$0

function usage(){
	echo "${SCRIPT_NAME} file number"
}

if [ $# -lt 2 ]    ; then 
	usage
	exit
fi

[ -f $1 ] ||  echo "the file is need!"

if [[ "$2" =~ "^[[:digit::]]$" ]] ;then
	echo "ff"
else
	echo 'f'
fi

FILE=$1
