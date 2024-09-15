#!/bin/bash

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)

# export DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

echo "Primary: "$PRIMARY
echo "Others: "$OTHERS

MONITORS=("$PRIMARY" "$OTHERS")

if type "xrandr"; then
    if [ ! -z "$PRIMARY" ]
    then
        env MONITOR=$PRIMARY TRAY=right polybar --reload default &> /dev/null &
    fi
    for m in $OTHERS; do
        if [ -z "$PRIMARY" ]
        then
            env MONITOR=$m TRAY=right polybar --reload default &> /dev/null &
        else
            env MONITOR=$m polybar --reload default &> /dev/null &
        fi
    done
fi

wait
