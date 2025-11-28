sketchybar 	--add item		sound right 				\
	   	--set sound		label.drawing=off 			\
					icon.color=$FOREGROUND 			\
					background.height=22			\
					background.corner_radius=12		\
					popup.background.color=$BACKGROUND	\
					popup.horizontal=off			\
					popup.align=center			\
					popup.y_offset=5			\
		--subscribe sound 	volume_change display_change space_change front_app_switched	mouse.entered	mouse.exited			\
										\
		--set sound		script=$PLUGIN_DIR/volume_icon.sh 	\
					click_script="sketchybar --set \$NAME popup.drawing=toggle"	\
					update_freq=5				\
										\
		--add slider 		sound_slide popup.sound 		\
		--set sound_slide 	icon.padding_right=10			\
					padding_right=5				\
					padding_left=5				\
					updates=on				\
					script=$PLUGIN_DIR/volume.sh		\
					slider.width=200			\
					slider.percentage=50			\
					slider.background.height=5		\
					slider.background.color=$BLUE		\
					slider.highlight_color=$FOREGROUND	\
					slider.knob=􀀁                         	\
		--subscribe sound_slide volume_change mouse.clicked		\

