source $HOME/.config/sketchybar/icons.sh
source $HOME/.config/sketchybar/colors.sh

wifi=(
	script=$PLUGIN_DIR/wifi.sh
	icon=$WIFI_DIS_ICN
	icon.color=$FOREGROUND
	icon.font="$FONT:Bold:18.0"
	icon.padding_left=15
	icon.padding_right=15
	label.drawing=off
	background.padding_left=10
	click_script="open -b com.apple.systempreferences /System/Library/PreferencePanes/Network.prefPane"
	popup.background.drawing=off
)
events=(
	wifi_change
	mouse.entered
	mouse.exited
	mouse.exited.global
)
popup=(
	icon.drawing=off
	background.color=$BACKGROUND
	background.border_width=2
	background.border_color=$BLUE
)

sketchybar	--add	item	wifi	right			\
		--set	wifi	"${wifi[@]}"			\
		--subscribe	wifi	"${events[@]}"		\
		--add	item	wifi.name	popup.wifi	\
		--set		wifi.name	"${popup[@]}"
