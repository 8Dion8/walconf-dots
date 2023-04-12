#!/bin/sh

source "/home/dion/.cache/wal/colors.sh"

if [[ "$1" == "--container" ]]; then
    echo "background-color: $background;"
elif [[ "$1" == "--infotext" ]]; then
    echo "color: $foreground;background-color: $color2;"
elif [[ "$1" == "--ctrl" ]]; then
    echo "color: $color3;"
    echo ".ctrl:hover {color: $foreground;}"
elif [[ "$1" == "--sep" ]]; then
    echo "color: $color3;"
elif [[ "$1" == "--checkbox" ]]; then
    echo "border: 2px solid $color3;&:checked {background-color: $color3;color: $color3;} &:hover {background-color: $color2;color: $color2;}"
fi