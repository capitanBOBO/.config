#!/usr/bin/env sh


case "$SENDER" in
	*) sketchybar --set $NAME label="$(date '+%H:%M')"
		;;
esac
