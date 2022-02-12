#!/bin/sh

killall -w redshift-gtk flameshot fcitx5 picom

redshift-gtk -t 6500:5000 -l 41.88:-87.62 &
fcitx5 &

flameshot &
picom -CGb &
