#!/bin/bash

DESTINATION=$1
echo destination: $DESTINATION
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    rsync -aAXHvkP \
          --delete \
          $HOME/* \
          $DESTINATION/
else
    exit 0
fi
