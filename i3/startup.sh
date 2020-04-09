#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg &

killall -w copyq redshift-gtk flameshot fcitx #picom

redshift-gtk -t 6500:5000 &
copyq &
fcitx &

flameshot &
# picom -CG &
