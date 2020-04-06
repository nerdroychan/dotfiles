#!/bin/sh

printf "Xft.dpi: 192" | xrdb -merge
printf "*dpi: 192" | xrdb -merge
xrdb -merge $HOME/.config/polybar/uhd.xresources
