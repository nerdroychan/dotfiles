#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg &

killall -w redshift-gtk flameshot fcitx picom

redshift-gtk -t 6500:5000 -l 41.88:-87.62 &
fcitx &

flameshot &
picom -CGb &
