#!/usr/bin/env sh

source $HOME/.config/sketchybar/colors.sh
source $HOME/.config/sketchybar/icons.sh

sketchybar --add item           apple.logo left                             \
                                                                            \
           --set apple.logo     icon=$APPLE_ICN                                 \
                                icon.font="$FONT:Bold:15.0"                \
                                icon.color=$GREEN                           \
                                background.padding_right=15                 \
                                label.drawing=off                           \
                                click_script="$POPUP_CLICK_SCRIPT"          
