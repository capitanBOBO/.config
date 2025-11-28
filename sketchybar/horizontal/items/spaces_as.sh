DISPLAYS=($(aerospace list-monitors --json | jq '.[]."monitor-id"'))

for i in "${DISPLAYS[@]}"; do
  SPACE_ICONS=($(aerospace list-workspaces --monitor $i))

  for j in "${SPACE_ICONS[@]}"; do
    space=(
      update_freq=60
      associated_display=$i
      label=$j
      background.color=$BACKGROUND
      background.height=$HEIGHT
      script="~/.config/sketchybar/horizontal/plugins/space_as.sh $j"
      click_script="aerospace workspace $j"
      label.font="$FONT:Bold:15.0"
      label.padding_right=10
      label.padding_left=10
    )
    sketchybar --add space space.$j left \
      --set space.$j "${space[@]}" \
      --subscribe space.$j aerospace_space_change
  done
done
