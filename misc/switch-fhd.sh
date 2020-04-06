#!/bin/sh

echo Xft.dpi: 144 | xrdb -merge
xrdb -merge $HOME/.config/polybar/default.xresources
