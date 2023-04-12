#!/bin/bash

SSID=$(iwgetid -r)


if [[ $SSID ]]; then
    echo "$SSID"
else
    echo "Offline"
fi