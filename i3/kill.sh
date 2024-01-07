#!/bin/sh

killall -q -w -u $USER \
    redshift \
    redshift-gtk \
    fcitx5 \
    flameshot \
    picom \

exit 0
