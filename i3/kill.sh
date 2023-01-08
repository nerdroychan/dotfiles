#!/bin/sh

killall -q -w -u $USER \
    redshift \
    redshift-gtk \
    flameshot \
    fcitx5 \
    picom \
    inotifywait \

exit 0
