source $HOME/.config/sketchybar/colors.sh

app=(
  click_script="open -a 'Mission Control'"
  script="$PLUGIN_DIR/app.sh"
  background.padding_left=15
  icon.background.drawing=on
  icon.background.image.scale=0.8
  background.color=$TRANSPARENT
  display=active
)
sketchybar --add item window_title left \
  --set window_title "${app[@]}" \
  --subscribe window_title front_app_switched
