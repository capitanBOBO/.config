#!/bin/bash

source $HOME/.config/sketchybar/colors.sh

did=$(echo "$NAME" | cut -d "." -f2)
CURRENT_ID=$(yabai -m query --displays --display | jq '.index')
if [[ "$did" == "$INFO" || $did == "$CURRENT_ID" ]]; then
	sketchybar	--set	$NAME	background.color=$GREEN	\
					label.color=$WHITE
else
	sketchybar	--set	$NAME	background.color=$RED	\
					label.color=$WHITE
fi
