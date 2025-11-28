#!/bin/zsh

source ~/.config/aerospace/scripts/alias.sh

WINDOWS_LIST=("${(@f)$(yabai -m query --windows | jq -r '.[] | "\(.id)\t\t \(.app) | \(.title)"')}")

SELECTED_WINDOW_ID=$(printf "%s\n" "${WINDOWS_LIST[@]}" | choose_base -p "Windows" | cut -f 1)

yabai -m window --focus $SELECTED_WINDOW_ID
exit
