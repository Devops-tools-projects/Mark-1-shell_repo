#!/bin/bash

#To find a file exists 

echo "provide the path that need to search"
read path

file=$(find $path $pwd -type f -name "$1")


if [[ -n "$file" ]]; then
	echo "file Found!!, Path = "$file""
else
	echo "file not found"
fi
