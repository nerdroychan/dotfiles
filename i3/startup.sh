#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg &

killall -w redshift-gtk flameshot fcitx picom

redshift-gtk -t 6500:5000 &
fcitx &

flameshot &
picom -CG &
