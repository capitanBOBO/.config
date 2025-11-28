#!/bin/bash

source $HOME/.config/sketchybar/colors.sh
# echo $INFO | jq >> ~/Desktop/debug.txt
WINDOWS=($(yabai -m query --spaces --space $SID | jq '.windows' | jq '.[]'))
TERMINAL_ID=$(yabai -m query --windows | jq 'map(select(.app == "Alacritty")) | .[] | .id')
if [[ $SELECTED = true ]]; then
  BACKGROUND_COLOR=$BLUE
  FOREGROUND_COLOR=$BACKGROUND
else
  BACKGROUND_COLOR=$BACKGROUND
  if [[ ${#WINDOWS[@]} -eq 0 ]]; then
    FOREGROUND_COLOR=$FOREGROUND
  elif [[ ${#WINDOWS[@]} -eq 1 && ${WINDOWS[@]} =~ $TERMINAL_ID ]]; then
    FOREGROUND_COLOR=$FOREGROUND
  else
    FOREGROUND_COLOR=$BLUE
  fi
fi

sketchybar --set $NAME icon.color=$FOREGROUND_COLOR \
  background.color=$BACKGROUND_COLOR
