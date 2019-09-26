#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk pasystray flameshot dropbox

fcitx &
redshift-gtk -l 31:121 -t 6500:5000 &
pasystray -m 100 &
copyq &
flameshot &
dropbox &
