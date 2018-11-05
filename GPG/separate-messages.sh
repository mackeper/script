#!/bin/bash
file_count=0
while IFS='' read -r line || [[ -n "$line" ]]; do
	if [ "============= separator =============" == "$line" ]
	then
		file_count=$((file_count+1))
	else
		echo $line >> "res_file$file_count.asc"
	fi
done < "$1"
file_count=$((file_count+1))
echo "$file_count created."
