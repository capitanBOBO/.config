source $HOME/.config/sketchybar/icons.sh

yabai=(
  script="$PLUGIN_DIR/yabai_type.sh"
  label.drawing=off
  icon.font="$FONT:Bold:20.0"
  icon.padding_left=0
  icon.padding_right=5
  background.padding_left=5
  display=active
)

events=(
  space_mode_update
  space_change
  display_change
  system_woke
  mouse.clicked
)

sketchybar --add item yabai_type left \
  --set yabai_type "${yabai[@]}" \
  --subscribe yabai_type "${events[@]}"
