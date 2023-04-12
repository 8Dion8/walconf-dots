#!/bin/bash

BATTERY="$(cat /sys/class/power_supply/BAT0/capacity)"


if [ "$BATTERY" = "charging" ]; then
    echo "100%"
else
    echo "${BATTERY}%"
fi