#!/bin/bash

# Encrypt or decrypt all files in directory
#
# Author: Marcus Östling

tmptar="tmp.tar.gz"
locked_file="locked"
script_file="lock_dir.sh"
exclude_rm="! -name $locked_file ! -name $script_file ! -name .git"

if [ "$1" != "" ] 
then
    if [[ "$1" = "unlock" ]] 
    then
        openssl aes-256-cbc -pbkdf2 -iter 1000 -d -a -in $locked_file -out $tmptar
        if [ $? -eq 0 ]
        then
            tar -xzf $tmptar
            rm $locked_file
            rm $tmptar
        fi
    fi

    if [[ "$1" = "lock" ]] 
    then
        tar --exclude=$script_file -czf $tmptar *
        openssl aes-256-cbc -pbkdf2 -iter 1000 -a -salt -in $tmptar -out $locked_file
        if [ $? -eq 0 ]
        then
            # Remove all files except this script and the encrypted .tar.gz
            for f in `find . -maxdepth 1 $exclude_rm`
            do
                if [[ "$f" != "." ]]
                then
                    rm -rf $f
                fi
            done
        fi
    fi
else
    echo "Usage: ./lock_dir.sh <unlock/lock>"
fi


