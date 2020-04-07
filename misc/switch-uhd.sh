#!/bin/sh

printf "Xft.dpi: 192" | xrdb -merge
printf "*dpi: 192" | xrdb -merge
xrdb -merge $HOME/.config/polybar/uhd.xresources
i3-msg restart &> /dev/null
$HOME/.config/i3/startup.sh
