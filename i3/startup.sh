#!/bin/sh

feh --bg-tile $HOME/.wallpaper.jpg

killall fcitx pasystray copyq redshift-gtk

fcitx &
copyq &
redshift-gtk -l 31:121 &
pasystray &
