#!/bin/bash 

start_time=$(date +%s)
if [ $# -ne 1 ]; then
	echo "Error: The script is run with a single parameter"
else
	if ! [[ $1 == */ ]]
	then
		echo "Error: Invalid syntax"
		echo "The parameter must be an absolute or relative path to a directory."
		echo "The parameter must end with '/'"
	else
		. ./print.sh
		print $1
		end_time=$(date +%s)
		echo "Script execution time (in seconds) = $(($end_time - $start_time))"
	fi
fi