#!/bin/sh

echo Xft.dpi: 192 | xrdb -merge
xrdb -merge $HOME/.config/polybar/uhd.xresources
