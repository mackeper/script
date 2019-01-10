#!/bin/bash

# Encrypt or decrypt a file
#
# Encrypt multiple files:
# Put them in a directory
# run : tar -czf /<directory>/
# then run this script on that file
# 
# Decrypt multiple file:
# run this script on a .tar.gz.enc file
# then run: tar -xzf <directory>.tar.gz file
#
# Author: Marcus Östling

if [ "$1" != "" ] 
then
    if [[ "$1" =~ .+\.enc ]] 
    then
        openssl aes-256-cbc -d -a -in $1 -out ${1%.enc}
    else
        openssl aes-256-cbc -a -salt -in $1 -out $1.enc
    fi

    # Remove the old file
    rm $1
else
    echo "Usage: ./encrypt.sh <file>"
fi


