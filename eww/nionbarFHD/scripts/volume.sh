#!/bin/bash

get_volume() {
	status=`amixer get Master | tail -n1 | grep -wo 'on'`

	if [[ "$status" == "on" ]]; then
		volume=`amixer get Master | tail -n1 | awk -F ' ' '{print $5}' | tr -d '[]'`
		echo "$volume"
	else
		echo "Mute"
	fi
}

get_volume