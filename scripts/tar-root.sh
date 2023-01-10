#!/bin/bash

ME=`basename "$0"`

if [ $# -ne 1 ]; then
    echo "Usage: $ME <destination>"
    exit 0;
fi

DESTINATION=$1
echo "destination: $DESTINATION"
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    FILE=$DESTINATION/$(date "+%F-%T").tar.gz
    tar --exclude=$HOME/.cache \
        --exclude-caches \
        --ignore-failed-read \
        --xattrs -czpvfh \
        $FILE $HOME /etc
else
    exit 0
fi
