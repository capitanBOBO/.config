source $HOME/.config/sketchybar/colors.sh
source $HOME/.config/sketchybar/icons.sh

dt=(
	update_freq=60
	background.height=$BACKGROUND_HEIGHT
	background.padding_left=10
	click_script="open -a Calendar.app"
	label.padding_left=0
	label.padding_right=0
)
popup=(
	popup.horizontal=on
)
events_subscribe=(
	mouse.entered
	mouse.exited
	mouse.exited.global
	mouse.clicked
	display_change
	space_change
	front_app_switched
)

sketchybar	--add	 item	clock_time	 right                  	\
		--set	 clock_time	script="$PLUGIN_DIR/clock_time.sh"   	\
					label.font="CoFo Kak:Medium:30.0" 		\
					"${dt[@]}"				\
		--subscribe	clock_time	system_woke			\
		--add	 item	clock_date	 right                  	\
		--set	 clock_date	script="$PLUGIN_DIR/clock_date.sh"   	\
					label.font="$FONT:Bold:13.0" 		\
					"${dt[@]}"				\
		--subscribe	clock_date	system_woke			\
		--add	item	clock_day	right				\
		--set	clock_day	script="$PLUGIN_DIR/clock_day.sh"   	\
					label.font="$FONT:Bold:13.0"		\
					icon=$CALENDAR_ICN			\
					icon.padding_right=5			\
					"${dt[@]}"				\
					"${popup[@]}"				\
		--subscribe	clock_day	system_woke #"${events_subscribe[@]}"

event_title=(
	label="Title"
	label.font="CoFo Kak:Medium:30"
)

sketchybar	--add	item	next_event_title	popup.clock_day		\
		--set		next_event_title	"${event_title[@]}"

event_time=(
	label="Time"
)

sketchybar	--add	item	next_event_time		popup.clock_day		\
		--set		next_event_time		"${event_time[@]}"

#event_description=(
#	label="Description"
#	y_offset=-5
#	width=0
#)

#sketchybar	--add	item	next_event_description	popup.clock_day		\
#		--set		next_event_description	"${event_description[@]}"
#
#event_url=(
#	label="Url"
#	y_offset=-30
#	width=0
#)
#
#sketchybar	--add	item	next_event_url		popup.clock_day		\
#		--set		next_event_url		"${event_url[@]}"
#
#sep=(
#	width=200
#	background.color=$TRANSPARENT
#	background.height=2
#	y_offset=-55
#)
#
#sketchybar	--add	item	separator		popup.clock_day		\
#		--set		separator		"${sep[@]}"
#bracket=(
#	background.color=$RED
#	background.padding_left=22
#)
#
#sketchybar	--add	bracket clock_block clock_time clock_date clock_day	\
#		--set		clock_block	"${bracket[@]}"		
