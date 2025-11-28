source $HOME/.config/sketchybar/icons.sh

sketchybar	--add	 item	clock	 right                  	\
		--set	 clock	update_freq=1                  		\
				script="$PLUGIN_DIR/clock.sh"   	\
				label.font="$FONT:Bold:12.0" 		\
				icon="$CALENDAR_ICN"			\
				background.height=$HEIGHT		\
				background.color=$BRIGHT_BLACK		\
				click_script="open -a Calendar.app"	\
				background.padding_right=-10		\
				label.padding_right=10			\
		--subscribe	clock
