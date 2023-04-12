#!/bin/bash

if [[ "$1" == "--pywal" ]]; then
    /home/dion/.config/awesome/set-pywal.py
elif [[ "$1" == "--fans" ]]; then
    asusctl profile -P Performance
fi
