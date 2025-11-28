#!/usr/bin/env sh

source $HOME/.config/sketchybar/icons.sh

DISPLAYS=("$DISPLAY_MAIN" "$DISPLAY_SEC" "3" "4")

source $HOME/.config/sketchybar/colors.sh
PADDING=15


for i in "${!DISPLAYS[@]}"; do
	did=$(($i+1))
	display=(
		associated_display=$did
		label=${DISPLAYS[i]}
		icon.drawing=off
		script="$PLUGIN_DIR/display.sh"
		background.padding_right=10
	)
	sketchybar	--add		item		display.$did		left	\
			--set		display.$did	"${display[@]}"			\
			--subscribe	display.$did	display_change	
done
