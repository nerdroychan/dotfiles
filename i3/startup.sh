#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk pasystray flameshot dropbox nm-applet picom

fcitx &
redshift-gtk -t 6500:5000 &
pasystray -m 100 &
copyq &
nm-applet &

firejail dropbox &
firejail flameshot &

picom -CG &
