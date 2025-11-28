#!/bin/bash

source ~/.config/sketchybar/icons.sh

setIcon() {
  VOLUME=$@
  if [[ $VOLUME -eq 100 ]]; then
          sketchybar --set $NAME icon=$SOUND3_ICN
  elif [[ $VOLUME -lt 100 && $VOLUME -gt 67 ]]; then
          sketchybar --set $NAME icon=$SOUND3_ICN
  elif [[ $VOLUME -lt 67 && $VOLUME -gt 34 ]]; then
          sketchybar --set $NAME icon=$SOUND2_ICN
  elif [[ $VOLUME -lt 34 && $VOLUME -gt 1 ]]; then
          sketchybar --set $NAME icon=$SOUND1_ICN
  elif [[ $VOLUME -eq 0 ]]; then
	  sketchybar --set $NAME icon=$SOUND0_ICN
  fi
}

