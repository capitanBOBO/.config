#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh
source $HOME/.config/sketchybar/colors.sh

init() {
  PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  CHARGING=$(pmset -g batt | grep 'AC Power')

  if [ $PERCENTAGE = "" ]; then
    exit 0
  fi

  case ${PERCENTAGE} in
  100)
    ICON=$BATTERY_100
    BACKGROUND_COLOR=$GREEN
    ;;
  [8-9][0-9])
    ICON=$BATTERY_75
    BACKGROUND_COLOR=$GREEN
    ;;
  [6-7][0-9])
    ICON=$BATTERY_75
    BACKGROUND_COLOR=$YELLOW
    ;;
  [3-5][0-9])
    ICON=$BATTERY_50
    BACKGROUND_COLOR=$YELLOW
    ;;
  [1-2][0-9])
    ICON=$BATTERY_25
    BACKGROUND_COLOR=$RED
    ;;
  *) ICON="$BATTERY_10" ;;
  esac

  if [[ $CHARGING != "" ]]; then
    ICON=$BATTERY_CHARGING
  fi

  sketchybar --set $NAME icon="$ICON" icon.color=$BACKGROUND_COLOR
  sketchybar --set $NAME.charge label="${PERCENTAGE}%"
}

popup() {
  sketchybar --set $NAME popup.drawing=$1
}

case "$SENDER" in
"mouse.entered")
  popup on
  ;;
"mouse.exited" | "mouse.exited.global")
  popup off
  ;;
*)
  init
  ;;
esac
