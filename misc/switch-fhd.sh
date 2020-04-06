#!/bin/sh

printf "Xft.dpi: 144" | xrdb -merge
printf "*dpi: 144" | xrdb -merge
xrdb -merge $HOME/.config/polybar/default.xresources
