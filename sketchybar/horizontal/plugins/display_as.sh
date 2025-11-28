#!/bin/bash

#DISPLAY_COUNT=$(yabai -m query --displays | jq '.[] .id' | wc -l | sed 's/ //g')
#
#if [[ "$DISPLAY_COUNT" == "1" ]]; then
#	sketchybar 	--set	$NAME	drawing=off
#	exit 1
#else
#	sketchybar	--set	$NAME	drawing=on
#fi

source $HOME/.config/sketchybar/colors.sh

did=$(echo "$NAME" | cut -d "." -f2)
  CURRENT_ID=$(aerospace list-monitors --focused | cut -d ' ' -f 1)
if [[ "$did" == "$INFO" || $did == "$CURRENT_ID" ]]; then
  sketchybar --set $NAME background.color=$GREEN
else
  sketchybar --set $NAME background.color=$RED
fi
