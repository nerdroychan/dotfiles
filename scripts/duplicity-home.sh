#!/bin/bash

ME=`basename "$0"`

if [ $# -ne 2 ]; then
    echo "Usage: $ME <keyid> <destination>"
    exit 0;
fi

KEYID=$1
DESTINATION=$2

echo "keyid: $KEYID, destination: $DESTINATION"
read -p "continue? [y/N] " r

if [ "$r" == "y" ] && [ ! -z $DESTINATION ]; then
    # this avoids directly writing to the same disk
    ARCHIVE_DIR=/tmp/$USER.duplicity
    mkdir -p $ARCHIVE_DIR &> /dev/null

    duplicity --verbosity info \
              --num-retries 3 \
              --progress \
              --volsize 500 \
              --archive-dir=$ARCHIVE_DIR \
              --use-agent \
              --encrypt-sign-key $KEYID \
              --exclude "$HOME/.*" \
              $HOME/ \
              $DESTINATION/
else
    exit 0
fi
