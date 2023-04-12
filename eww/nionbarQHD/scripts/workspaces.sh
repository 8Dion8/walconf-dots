#!/bin/sh

source "/home/dion/.cache/wal/colors.sh"

get_ws_status() {
    #echo $1
    status="$(wmctrl -d | sed -n $1p | awk '{print $2}')"
    #echo $status
    if [[ "$status" != "-" ]]; then
        echo "background-color: $color2;"
    else
        echo "background-color: $color1;"
    fi
}

if [[ "$1" == "--one" ]]; then
    get_ws_status 1
elif [[ "$1" == "--two" ]]; then
    get_ws_status 2
elif [[ "$1" == "--three" ]]; then
    get_ws_status 3
elif [[ "$1" == "--four" ]]; then
    get_ws_status 4
elif [[ "$1" == "--five" ]]; then
    get_ws_status 5
fi