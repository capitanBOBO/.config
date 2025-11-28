#!/usr/bin/env zsh

declare -A mode=([stack]=bsp [bsp]=float [float]=stack)

CURRENT=$(yabai -m query --spaces --space | jq '.type' | sed s/\"//g)

NEW=${mode[$CURRENT]}

yabai -m space --layout $NEW

sketchybar --trigger space_mode_update
