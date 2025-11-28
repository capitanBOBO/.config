source $HOME/.config/sketchybar/colors.sh
SPACE_ICONS=($(yabai -m query --spaces | jq '.[]' | jq '.index'))

events=(
	space_change
	display_change
	send_window
)

for i in "${SPACE_ICONS[@]}"
do
    sid=$i
    space=(
	associated_space=$sid     		
	label=$sid             		
	icon.drawing=off			
	padding_left=5				
	script="$PLUGIN_DIR/space.sh"		
	click_script="skhd -k \"ctrl - $sid\"" 	
)

    sketchybar	--add		space		space.$sid	left			\
        	--set		space.$sid	"${space[@]}"				\
		--subscribe	space.$sid 	"${events[@]}" 

done

bracket_prop=(
	background.color=$RED
	background.heigh=20
)

sketchybar 	--add	bracket spaces space.1 space.2 space.3	\
		--set		spaces "${bracket_prop[@]}"
