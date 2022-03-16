#!/bin/bash

DESTINATION=$1
echo destination: $DESTINATION
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    sudo rsync -aAXHv \
          --delete \
          --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
          / $DESTINATION
else
    exit 0
fi
