#!/bin/sh

printf 'Xft.dpi: 192' | xrdb -merge
printf '*dpi: 192' | xrdb -merge
xrdb -merge $HOME/.config/polybar/default.xresources
i3-msg restart &> /dev/null
