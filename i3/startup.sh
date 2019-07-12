#!/bin/sh

feh --bg-fill $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk pasystray

fcitx &
redshift-gtk -l 31:121 -t 6500:5000 &
pasystray &
copyq &
