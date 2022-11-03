#!/bin/bash

# only backup the following (these data cannot be easily reconstructed):
#   Desktop
#   Documents
#   Workspace

DESTINATION=$1
echo destination: $DESTINATION
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    rsync -aAXHvkP \
          --delete \
          $HOME/Desktop \
          $HOME/Documents \
          $HOME/Workspace \
          $DESTINATION/
else
    exit 0
fi
