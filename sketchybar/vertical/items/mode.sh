#!/usr/bin/env sh
mode=(
	script="$PLUGIN_DIR/mode.sh"
	icon.drawing=off 			
)
sketchybar	--add	item	current_mode	right	\
		--set	current_mode	"${mode[@]}"	\
		--subscribe	current_mode mode_was_changed
