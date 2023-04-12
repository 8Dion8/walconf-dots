STATUS=$(mpris-ctl status)


if [[ $STATUS ]]; then
    NAME=$(mpris-ctl info %track_name | tail -n1)
    ARTIST=$(mpris-ctl info %artist_name | tail -n1)
    MSGLENGTH=$((${#NAME} + ${#ARTIST}))
    if [[ $MSGLENGTH -lt 31 ]]; then 
        echo "$ARTIST: $NAME"
    else
        ARTISTLEN=${#ARTIST}
        MAXNAMELEN=$((25-$ARTISTLEN))
        #echo "${MAXNAMELEN}"
        echo "$ARTIST: ${NAME:0:$MAXNAMELEN}..."
    fi
else
    echo "Offline"
fi