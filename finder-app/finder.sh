#!/bin/sh

filesdir=$1
searchstr=$2


if [ -z "$filesdir" ] || [ -z "$searchstr" ]
then
    echo "Error: Please specify the directory and search string"
    exit 1
fi


if [ ! -d "$filesdir" ]
then
    echo "Error: $filesdir is not a directory"
    exit 1
fi

X=$(find $filesdir -type f | wc -l)
Y=$(grep -r $searchstr $filesdir | wc -l)

printf "The number of files are ${X} and the number of matching lines are ${Y}\n"