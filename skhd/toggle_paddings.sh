#! /bin/bash

spcs=($(yabai -m query --spaces | jq '.[].index'))

for spc in ${spcs[@]}; do
	yabai -m space $spc --toggle padding 
	yabai -m space $spc --toggle gap 
done
