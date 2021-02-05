#!/bin/sh

killall -q polybar

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

echo $PRIMARY
echo $OTHERS

if type "xrandr"; then
    env MONITOR=$PRIMARY TRAY=right polybar --reload default &> /tmp/polybar-$MONITOR.log &
    for m in $OTHERS; do
        env MONITOR=$m polybar --reload default &> /tmp/polybar-$MONITOR.log &
    done
fi
