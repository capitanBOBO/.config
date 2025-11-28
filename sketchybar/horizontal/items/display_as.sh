source $HOME/.config/sketchybar/colors.sh
source $HOME/.config/sketchybar/icons.sh

DISPLAYS=("$DISPLAY_MAIN" "$DISPLAY_SEC" "3" "4")

for i in "${!DISPLAYS[@]}"; do
	did=$(($i+1))

	display=(
		associated_display=$did		
		label=${DISPLAYS[i]}		
		label.font="$FONT:Bold:15.0"	
    label.color=$BACKGROUND
		background.color=$BACKGROUND	
		background.height=$HEIGHT	
		icon.drawing=off		
		padding_left=-10		
		label.padding_left=10		
		label.padding_right=10		
		script="$PLUGIN_DIR/display_as.sh"	
	)
	sketchybar	--add	item	display.$did	left			\
			--set		display.$did	"${display[@]}"		\
			--subscribe	display.$did	display_change	
done
