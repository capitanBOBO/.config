source ~/.config/sketchybar/icons.sh
source ~/.config/sketchybar/colors.sh
sound=(
  label.drawing=off
  icon=$SOUND_OFF_ICN
  icon.padding_left=10
  icon.padding_right=10
  background.padding_left=10
  click_script="sketchybar  --set sound popup.drawing=toggle"
  popup.y_offset=-100
)

events=(
  volume_change
  system_woke
)

sketchybar \
  --add item sound right \
  --set sound "${sound[@]}" \
  --subscribe sound "${events[@]}"

OUTPUTS=($(SwitchAudioSource -a -t output))

title=(
  label="Output"
  label.color=$GREEN
  icon=$SOUND0_ICN
  icon.padding_left=10
)

sketchybar \
  --add item output_title popup.sound \
  --set output_title "${title[@]}"

OFFSET_INIT=35
OFFSET_STEP=-25
for INDEX in ${!OUTPUTS[@]}; do
  OFFSET=$OFFSET_INIT-$OFFSET_STEP
  output_title=(
    label=${OUTPUTS[$INDEX]}
  )
  sketchybar \
    --add item output.$INDEX popup.sound \
    --set output.$INDEX "${output_title[@]}"
  OFFSET_INIT=$OFFSET
done
