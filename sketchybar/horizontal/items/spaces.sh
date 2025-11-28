SPACE_ICONS=($(yabai -m query --spaces | jq '.[]' | jq '.index'))

for i in "${SPACE_ICONS[@]}"; do
  sid=$i

  space=(
    associated_space=$sid
    icon=$sid
    background.color=$BACKGROUND
    background.height=38
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
    click_script="skhd -k \"ctrl - $sid\""
    icon.font="$FONT:Bold:15.0"
    icon.padding_left=10
    icon.padding_right=10
    padding_right=5
  )

  sketchybar --add space space.$sid left \
    --set space.$sid "${space[@]}" \
    --subscribe space.$sid space_change display_change send_window

done
