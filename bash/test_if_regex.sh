#!/bin/bash
for file in * ; do
	reular='(.*)\.(sh)'
	if [[ $file =~ $reular ]]; then
		echo $file
		echo 
		echo "0 ${BASH_REMATCH[0]}"
		echo "1 ${BASH_REMATCH[1]}"
		echo "2 ${BASH_REMATCH[2]}"
	fi
done
