#!/bin/bash

source $HOME/.config/sketchybar/colors.sh
#DISPLAY_COUNT=$(yabai -m query --displays | jq '.[] .id' | wc -l | sed 's/ //g')
#
#if [[ "$DISPLAY_COUNT" == "1" ]]; then
#	sketchybar 	--set	$NAME	drawing=off
#	exit 1
#else
#	sketchybar	--set	$NAME	drawing=on
#fi


did=$(echo "$NAME" | cut -d "." -f2)
  CURRENT_ID=$(yabai -m query --displays --display | jq '.index')
if [[ "$did" == "$INFO" || $did == "$CURRENT_ID" ]]; then
  sketchybar --set $NAME background.color=$GREEN
else
  sketchybar --set $NAME background.color=$RED
fi
