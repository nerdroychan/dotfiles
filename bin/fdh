#!/bin/sh

printf "Xft.dpi: 144" | xrdb -merge
printf "*dpi: 144" | xrdb -merge
xrdb -merge $HOME/.config/polybar/fhd.xresources
i3-msg restart &> /dev/null
