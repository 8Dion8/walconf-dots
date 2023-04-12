#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x


dir="$HOME/.config/rofi/launchers/text"
styles=($(ls -p --hide="colors.rasi" $dir/styles))
color="${styles[$(( $RANDOM % 10 ))]}"


rofi -no-lazy-grab -show drun \
-modi drun \
-theme $dir/"style" #-normal-window

