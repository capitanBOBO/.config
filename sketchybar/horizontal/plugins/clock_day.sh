#!/usr/bin/env sh

popup() {
	sketchybar	--set	$NAME	popup.drawing=$1
}

case "$SENDER" in
	"mouse.entered")
		popup on
		;;
	"mouse.exited" | "mouse.exited.global" | "display_change" | "space_change" | "front_app_switched")
		popup off
		;;
	*) 
TODAY=$(date +%a)
		sketchybar --set $NAME label="$TODAY"
		;;
esac
