#!/bin/sh

feh --bg-tile $HOME/.wallpaper.jpg

killall -w fcitx copyq redshift-gtk pasystray

fcitx &
redshift-gtk -l 31:121 &
pasystray &
copyq &
