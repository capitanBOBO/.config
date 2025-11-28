#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

update() {
  TYPE=$(yabai -m query --spaces --space | jq '.type' | sed s/\"//g)
  case "$TYPE" in
  "stack")
    ICON="$YABAI_STACK_ICN"
    ;;
  "bsp")
    ICON="$YABAI_BSP_ICN"
    ;;
  "float")
    ICON="$YABAI_FLOAT_ICN"
    ;;
  *)
    exit 0
    ;;
  esac
  sketchybar --set $NAME icon="$ICON"
}

click() {
  TYPE=$(yabai -m query --spaces --space | jq '.type' | sed s/\"//g)
  SPACE_ID=$(yabai -m query --spaces --space | jq '.index')
  case "$TYPE" in
  "stack")
    LAYOUT=bsp
    ;;
  "bsp")
    LAYOUT=float
    ;;
  "float")
    LAYOUT=stack
    ;;
  *)
    exit 0
    ;;
  esac
  #yabai	-m	config	layout	$LAYOUT
  yabai -m space --layout $LAYOUT
  update
}

case "$SENDER" in
"forced" | "display_change" | "space_change" | "yabai_mode_toggle")
  update
  ;;
"mouse.clicked")
  click
  ;;
*)
  exit 0
  ;;
esac
