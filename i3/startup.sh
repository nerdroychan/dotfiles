#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk pasystray flameshot dropbox nm-applet

firejail fcitx &
firejail redshift-gtk -t 6500:5000 &
firejail pasystray -m 100 &
firejail copyq &
firejail dropbox &
firejail nm-applet &

unshare -n -U flameshot &
