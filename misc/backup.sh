#!/bin/sh

DESTINATION=/run/media/chen/backup
HOME=/home/chen
FILE=$DESTINATION/$(date "+%F-%T").tar.gz

tar --exclude=$HOME/.cache \
    --exclude=$HOME/AUR \
    --exclude-caches \
    --ignore-failed-read \
    --xattrs -czpvf \
    $FILE $HOME /etc
