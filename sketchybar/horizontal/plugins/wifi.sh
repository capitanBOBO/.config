#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

popup() {
	sketchybar	--set	$NAME	popup.drawing=$1
}

name() {
	DEVICE=$(scutil --nwi | sed -n "s/.*Network interfaces: \([^,]*\).*/\1/p")
	NETWORK_NAME=$(networksetup -getairportnetwork "$DEVICE" | sed -n "s/Current Wi-Fi Network: \(.*\)/\1/p")
	if [[ -z "$NETWORK_NAME" ]]; then
		ICON=$WIFI_DIS_ICN
		DRAWING=off
	else
		ICON=$WIFI_ICN
		DRAWING=on
	fi

	sketchybar	--set	$NAME	icon=$ICON	\
			--set	wifi.name	drawing=$DRAWING	\
			--set	wifi.name	label="$NETWORK_NAME"
}

case "$SENDER" in
	"mouse.entered")
		popup on
		;;
	"mouse.exited")
		popup off
		;;
	"wifi_change" | "forced")
		name
		;;
esac
