#!/usr/bin/env sh
source $HOME/.config/sketchybar/icons.sh
next() {
  osascript -e 'tell application "Spotify" to play next track'
}
back() {
  osascript -e 'tell application "Spotify" to play previous track'
}
play() {
  osascript -e 'tell application "Spotify" to playpause'
}

mouse_clicked() {
  case "$NAME" in
  "spotify_back")
    back
    ;;
  "spotify_next")
    next
    ;;
  "spotify_play")
    play
    ;;
  "spotify_title" | "spotify_artist")
    open -a Spotify.app
    ;;
  "spotify_anchor")
    popup toggle
    ;;
  esac
}

popup() {
  sketchybar --set $NAME popup.drawing=$1
}

update() {
  APP=$(echo "$INFO" | jq -r '.app')
  if [ "$APP" != "Spotify" ]; then
    exit 0
  fi
  STATE=$(echo "$INFO" | jq -r '.state')
  if [ "$STATE" == "playing" ]; then
    TITLE=$(echo "$INFO" | jq -r '.title')
    ARTIST=$(echo "$INFO" | jq -r '.artist')
    sketchybar --set $NAME drawing=on \
      --set spotify_title label="$TITLE" \
      --set spotify_artist label="$ARTIST" \
      --set spotify_play icon=$PAUSE_ICN
  else
    sketchybar --set spotify_play icon=$PLAY_ICN
  fi
}

#forced() {
#	if [ "$NAME" != "spotify_anchor" ]; then
#		exit 0
#	fi
#	APP_STATE=$(pgrep -x Spotify)
#	if [[ ! $APP_STATE ]]; then
#		sketchybar	--set	spotify_anchor	drawing=off
#	else
#		sketchybar	--set	spotify_anchor	drawing=on
#	fi
#}

case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
"mouse.entered")
  popup on
  ;;
"mouse.exited" | "mouse.exited.global" | "display_change" | "space_change" | "front_app_switched")
  popup off
  ;;
"forced")
  exit 0
  ;;
*)
  update
  ;;
esac
