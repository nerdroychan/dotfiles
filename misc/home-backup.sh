#!/bin/bash

DESTINATION=$1
echo destination: $DESTINATION
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    rsync -aAXHvkP \
          --delete \
          $HOME/Archives \
          $HOME/Desktop \
          $HOME/Documents \
          $HOME/Music \
          $HOME/Pictures \
          $HOME/Videos \
          $HOME/Workspace \
          $DESTINATION/
else
    exit 0
fi
