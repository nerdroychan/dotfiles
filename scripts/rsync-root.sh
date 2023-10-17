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
    sudo rsync -aAXHvP \
         --delete \
         --exclude=/dev/* \
         --exclude=/proc/* \
         --exclude=/sys/* \
         --exclude=/tmp/* \
         --exclude=/run/* \
         --exclude=/mnt/* \
         --exclude=/media/* \
         --exclude=/var/run/* \
         --exclude=/var/cache/* \
         / $DESTINATION/
else
    exit 0
fi
