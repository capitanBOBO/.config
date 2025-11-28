source $HOME/.config/sketchybar/colors.sh

battery=(
  script="$PLUGIN_DIR/battery.sh"
  update_freq=10
  label.drawing=off
  icon.font="$FONT:Bold:18.0"
  icon.padding_left=10
  icon.padding_right=10
  background.padding_left=10
  popup.background.drawing=off
)

popup=(
  icon.drawing=off
  background.color=$BACKGROUND
  background.border_width=2
  background.border_color=$BLUE
)

events=(
  system_woke
  power_source_change
  mouse.entered
  mouse.exited
  mouse.exited.global
)

sketchybar --add item battery right \
  --set battery "${battery[@]}" \
  --subscribe battery "${events[@]}"

sketchybar --add item battery.charge popup.battery \
  --set battery.charge "${popup[@]}"
