#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk flameshot picom

fcitx &
redshift-gtk -t 6500:5000 &
copyq &

firejail flameshot &

picom -CG &
