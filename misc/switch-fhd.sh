#!/bin/sh

printf "Xft.dpi: 144" | xrdb -merge
printf "*dpi: 144" | xrdb -merge
xrdb -merge $HOME/.config/polybar/default.xresources
i3-msg restart &> /dev/null
$HOME/.config/i3/startup.sh
