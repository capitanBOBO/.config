#! /bin/bash

param=$1
spcs=($(yabai -m query --spaces | jq '.[].index'))
for spc in ${spcs[@]}; do
	if [[ "$param" == "inc" ]]; then
		yabai -m space $spc --padding rel:5:5:5:5
		yabai -m space $spc --gap rel:5
	elif [[ "$param" == "dec" ]]; then
		yabai -m space $spc --padding rel:-5:-5:-5:-5
		yabai -m space $spc --gap rel:-5
	elif [[ "$param" == "toggle" ]]; then
		yabai -m space $spc --toggle padding 
		yabai -m space $spc --toggle gap 
	fi
done
