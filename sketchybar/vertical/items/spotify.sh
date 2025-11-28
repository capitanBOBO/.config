source $HOME/.config/sketchybar/colors.sh
source $HOME/.config/sketchybar/icons.sh
anchor=(
  script="$PLUGIN_DIR/spotify.sh"
  label.drawing=off
  icon.background.drawing=on
  icon.background.image="app.Spotify"
  icon.background.image.scale=1.0
  background.color=$TRANSPARENT
  background.padding_right=10
  popup.horizontal=on
  popup.align=center
  popup.height=110
  drawing=off
)

events=(
  mouse.entered
  mouse.exited
  mouse.exited.global
  mouse.clicked
  display_change
  space_change
  front_app_switched
  media_change
)
sketchybar --add item spotify_anchor right \
  --set spotify_anchor "${anchor[@]}" \
  --subscribe spotify_anchor "${events[@]}"

title=(
  script="$PLUGIN_DIR/spotify.sh"
  label="Title"
  icon.drawing=off
  y_offset=35
  width=0
  label.max_chars=10
)

sketchybar --add item spotify_title popup.spotify_anchor \
  --set spotify_title "${title[@]}" \
  --subscribe spotify_title mouse.clicked

artist=(
  script="$PLUGIN_DIR/spotify.sh"
  label="Artist"
  icon.drawing=off
  y_offset=10
  width=0
  label.max_chars=10
)

sketchybar --add item spotify_artist popup.spotify_anchor \
  --set spotify_artist "${artist[@]}" \
  --subscribe spotify_artist mouse.clicked

spotify_back=(
  icon=$PREV_ICN
  icon.padding_left=5
  icon.padding_right=8
  icon.color=$FOREGROUND
  script="$PLUGIN_DIR/spotify.sh"
  label.drawing=off
  y_offset=-25
  background.padding_left=10
  background.color=$GREEN
)

sketchybar --add item spotify_back popup.spotify_anchor \
  --set spotify_back "${spotify_back[@]}" \
  --subscribe spotify_back mouse.clicked

spotify_play=(
  icon=$PLAY_ICN
  background.height=40
  background.corner_radius=20
  width=40
  align=center
  background.color=$GREEN
  background.border_color=$BACKGROUND
  background.border_width=2
  background.drawing=on
  icon.padding_left=4
  icon.padding_right=5
  icon.color=$FOREGROUND
  updates=on
  label.drawing=off
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-25
)

sketchybar --add item spotify_play popup.spotify_anchor \
  --set spotify_play "${spotify_play[@]}" \
  --subscribe spotify_play mouse.clicked

spotify_next=(
  icon=$NEXT_ICN
  icon.padding_left=5
  icon.padding_right=8
  icon.color=$FOREGROUND
  label.drawing=off
  background.color=$GREEN
  background.padding_right=10
  script="$PLUGIN_DIR/spotify.sh"
  y_offset=-25
)

sketchybar --add item spotify_next popup.spotify_anchor \
  --set spotify_next "${spotify_next[@]}" \
  --subscribe spotify_next mouse.clicked

spotify_control=(
  y_offset=-25
  background.drawing=on
  background.color=$GREEN
)

#sketchybar	--add	bracket	spotify_control spotify_back	\
#						spotify_play	\
#						spotify_next	\
#		--set		spotify_control	"${spotify_control[@]}"
