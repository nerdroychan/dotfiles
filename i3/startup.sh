#!/bin/sh

# with tray icons
unshare -c -n flameshot &
unshare -c -n fcitx5 &

# headless, assuming they won't crash..
unshare -c -n redshift -t 6500:5000 -l 41.88:-87.62 &
unshare -c -n picom -CGb &

exit 0
