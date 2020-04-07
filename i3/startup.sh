#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg &

killall -w copyq redshift-gtk flameshot picom fcitx5

redshift-gtk -t 6500:5000 &
copyq &
fcitx5 &

flameshot &

picom -CG &
