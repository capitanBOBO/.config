source $HOME/.config/sketchybar/colors.sh

separator=(
	background.height=2
	background.color=$BLUE
	background.padding_left=15
	background.padding_right=5
	icon.drawing=off
	label.padding_left=22
	label.padding_right=22
)

sketchybar	--add	item	separator_right		right				\
		--set		separator_right		"${separator[@]}"	
