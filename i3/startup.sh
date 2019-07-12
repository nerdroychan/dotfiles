#!/bin/sh

feh --bg-tile $HOME/.wallpaper.jpg

killall fcitx copyq redshift-gtk pasystray
sleep 1
fcitx &
redshift-gtk -l 31:121 &
pasystray &
copyq &
