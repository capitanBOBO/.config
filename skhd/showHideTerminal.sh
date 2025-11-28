#! /bin/bash

# Fetch display data
CURRENT_DISPLAY=$(cat ~/.config/skhd/config.json | jq '.selectedDisplayIndex')
CURRENT_OFFSET=$(cat ~/.config/skhd/config.json | jq '.barOffset')
SIDES_OFFSET=$(cat ~/.config/skhd/config.json | jq '.sidesOffset')
BAR_POSITION=$(cat ~/.config/skhd/config.json | jq '.barPosition')
TERMINAL=$(car ~/.config/skhd/config.json | jq '.terminal')
DISPLAYS_COUNT=$(yabai -m query --displays | jq '.[]' | grep frame | wc -l)
if (($CURRENT_DISPLAY > $DISPLAYS_COUNT)); then
  CURRENT_DISPLAY=1
fi
TARGET_DISPLAY_FRAME=$(yabai -m query --displays --display $CURRENT_DISPLAY | jq '.frame')
X=$(echo $TARGET_DISPLAY_FRAME | jq | grep 'x' | cut -d ':' -f 2 | sed 's/\ //g' | sed 's/,//g')
Y=$(echo $TARGET_DISPLAY_FRAME | jq | grep 'y' | cut -d ':' -f 2 | sed 's/\ //g' | sed 's/,//g')
W=$(echo $TARGET_DISPLAY_FRAME | jq | grep 'w' | cut -d ':' -f 2 | sed 's/\ //g' | sed 's/,//g')
H=$(echo $TARGET_DISPLAY_FRAME | jq | grep 'h' | cut -d ':' -f 2 | sed 's/\ //g' | sed 's/,//g')
if [[ "$BAR_POSITION" == "left" ]]; then
  FINAL_X=$(echo "$X + $CURRENT_OFFSET + $SIDES_OFFSET" | bc)
  FINAL_Y=$(echo "$Y + $SIDES_OFFSET" | bc)
  FINAL_W=$(echo "$W - $CURRENT_OFFSET - ( $SIDES_OFFSET * 2 )" | bc)
  FINAL_H=$(echo "$H  - ( $SIDES_OFFSET * 2 )" | bc)
else
  FINAL_X=$(echo "$X + $SIDES_OFFSET" | bc)
  FINAL_Y=$(echo "$Y + $CURRENT_OFFSET + $SIDES_OFFSET" | bc)
  FINAL_W=$(echo "$W - ( $SIDES_OFFSET * 2 )" | bc)
  FINAL_H=$(echo "$H - $CURRENT_OFFSET - ( $SIDES_OFFSET * 2 )" | bc)
fi

osascript - $FINAL_X $FINAL_Y $FINAL_W $FINAL_H <<'EOF'
on run argv
tell application "Finder"
if visible of process "Alacritty" is true then
	set visible of process "Alacritty" to false
else
	set x to item 1 of argv
	set y to item 2 of argv
	set w to item 3 of argv
	set h to item 4 of argv
	tell process "Alacritty"
	set visible to true
	set frontmost to true
	set position of window 1 to { x, y }
	delay 0.1
	set size of window 1 to { w, h }
	end tell
end if
end tell
end run
EOF
