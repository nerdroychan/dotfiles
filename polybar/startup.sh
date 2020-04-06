#!/bin/sh

killall -q polybar

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload default &> /tmp/polybar-$m.log &
    done
fi
