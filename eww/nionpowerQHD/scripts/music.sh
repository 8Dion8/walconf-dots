#!/bin/bash

if [[ "$1" == "--art" ]]; then 
    STATUS=$(mpris-ctl status)
    if [[ $STATUS ]]; then
        ARTURL=$(mpris-ctl info %art_url)
        echo "${ARTURL}"
    else
        echo "images/empty.jpg"
    fi

elif [[ "$1" == "--name" ]]; then
    STATUS=$(mpris-ctl status)
    if [[ $STATUS ]]; then
        NAME=$(mpris-ctl info %album_artist)
        NAMELEN=(${#NAME})
        if [[ $NAMELEN -lt 15 ]]; then
            echo "${NAME}"
        else 
            MAXNAMELEN=$((12-$NAMELEN))
            echo "${NAME:0:$MAXNAMELEN}..."
        fi
    fi

elif [[ "$1" == "--title" ]]; then
    STATUS=$(mpris-ctl status)
    if [[ $STATUS ]]; then
        TITLE=$(mpris-ctl info %track_name)
        TITLELEN=(${#TITLE})
        if [[ $TITLELEN -lt 15 ]]; then
            echo "${TITLE}"
        else 
            MAXTITLELEN=$((12-$TITLELEN))
            echo "${TITLE:0:$MAXTITLELEN}..."
        fi
    fi
fi