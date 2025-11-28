#!/usr/bin/env sh


case "$SENDER" in
	*) sketchybar --set $NAME label="$(date '+%h %d')"
		;;
esac
