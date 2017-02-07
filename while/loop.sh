#!/bin/sh

function get_desc()
{
	index=()
	value=()
	count=0
	
	while read LINE
	do
		index[$count]=`echo $LINE | cut -d '=' -f1`
		value[$count]=`echo $LINE | cut -d '=' -f2`
		count=$((count+1))
	done < ./desc.ini
	
	#just get the index, not value
	for i in "${!index[@]}"
	do
		if [ "$1" == "${index[$i]}" ]
		then
			echo "${value[$i]}"
		fi
	done
}

desc=`get_desc bb`
echo "$desc"
desc=`get_desc cc`
echo "$desc"
