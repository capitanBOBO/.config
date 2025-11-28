#!/usr/bin/env sh
mode=(
	script="$PLUGIN_DIR/mode.sh"
	icon.drawing=off 			
  label.padding_right=5
  label.padding_left=5
  background.padding_right=5
  background.height=$HEIGHT
)
sketchybar	--add	item	current_mode	right	\
		--set	current_mode	"${mode[@]}"	\
		--subscribe	current_mode mode_was_changed
