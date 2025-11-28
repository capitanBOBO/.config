INPUT="TextInputMenuAgent,Item-0"
PADDING=10
input=(
	alias.color=$WHITE
	label.drawing=off
	icon.drawing=off
	background.padding_left=10
	label.padding_left=0
	label.padding_right=0
)
sketchybar	--add	alias	$INPUT	right			\
		--set 	$INPUT	"${input[@]}"
