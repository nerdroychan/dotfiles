#!/bin/bash

# with tray icons
unshare -c -n flameshot &
unshare -c -n fcitx5 &

# headless, assuming they won't crash..
unshare -c -n redshift -t 6500:5000 -l 42.74:-84.48 &
unshare -c -n picom -CG &

# xss-lock to lock on suspend
xss-lock -- $HOME/.lock.sh &

wait
