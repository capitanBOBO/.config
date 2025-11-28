#!/usr/bin/env sh

if [[ -n "$INFO" ]]; then
  sketchybar --set $NAME \
    icon.background.image="app.$INFO"
fi
