#!/bin/bash

ME=`basename "$0"`

if [ $# -ne 4 ]; then
    echo "Usage: $ME <enckey> <signkey> <destination> <identifier>"
    exit 0;
fi

ENCKEY=$1
SIGNKEY=$2
DESTINATION=$3
IDENTIFIER=$4

echo "enckey: $ENCKEY, signkey: $SIGNKEY, destination: $DESTINATION, identifier: $IDENTIFIER"
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z "$DESTINATION" ]; then
    duplicity --verbosity info \
              --num-retries 3 \
              --progress \
              --volsize 500 \
              --use-agent \
              --name "$IDENTIFIER" \
              --encrypt-key "$ENCKEY" \
              --sign-key "$SIGNKEY" \
              --exclude "$HOME/.*" \
              --exclude "$HOME/VM" \
              "$HOME/" \
              "$DESTINATION/"
else
    exit 0
fi
