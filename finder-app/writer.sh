#!/bin/sh

writefile=$1
writestr=$2

if [ -z "$writefile" ] || [ -z "$writestr" ]
then
    echo "Error: Please specify the file and string to write"
    exit 1
fi

mkdir -p $(dirname $writefile) || { echo "Error: Could not create directory"; exit 1; }
echo $writestr > $writefile || { echo "Error: Could not write to file $writefile"; exit 1; }