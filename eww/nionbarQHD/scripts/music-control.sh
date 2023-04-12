if [[ "$1" == "--toggle" ]]; then
	dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
elif [[ "$1" == "--next" ]]; then
	{ mpris-ctl next; }
elif [[ "$1" == "--prev" ]]; then
	{ mpris-ctl prev; }
fi