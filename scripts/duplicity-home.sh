#!/bin/bash

ME=`basename "$0"`

if [ $# -ne 3 ]; then
    echo "Usage: $ME <enckey> <signkey> <destination>"
    exit 0;
fi

ENCKEY=$1
SIGNKEY=$2
DESTINATION=$3

echo "enckey: $ENCKEY, signkey: $SIGNKEY, destination: $DESTINATION"
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    duplicity --verbosity info \
              --num-retries 3 \
              --progress \
              --volsize 500 \
              --use-agent \
              --encrypt-key $ENCKEY \
              --sign-key $SIGNKEY \
              --exclude "$HOME/.*" \
              $HOME/ \
              $DESTINATION/
else
    exit 0
fi
