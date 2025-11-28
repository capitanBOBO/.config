#!/bin/bash

source $HOME/.config/sketchybar/colors.sh

ARG=$1
update() {
  # echo "aerospace focused $AEROSPACE_FOCUSED_WORKSPACE, arg $ARG" >> ~/Desktop/debug.txt
  if [ "$ARG" == "$AEROSPACE_FOCUSED_WORKSPACE" ]; then
    sketchybar --set space.$ARG label.color=$BACKGROUND background.color=$BLUE
  else
    sketchybar --set space.$ARG label.color=$FOREGROUND background.color=$BACKGROUND
  fi
}

init() {
  CURRENT_SPACE=$(aerospace list-workspaces --focused)
  # echo "current space $CURRENT_SPACE" >>~/Desktop/debug.txt
  sketchybar --set space.$CURRENT_SPACE label.color=$BACKGROUND background.color=$BLUE
}

case "$SENDER" in
"aerospace_space_change")
  update
  ;;
*)
  init
  ;;
esac
