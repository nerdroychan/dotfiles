#!/bin/sh

printf 'Xft.dpi: 160' | xrdb -merge
printf '*dpi: 160' | xrdb -merge
xrdb -merge $HOME/.config/polybar/fhd.xresources
i3-msg restart &> /dev/null
