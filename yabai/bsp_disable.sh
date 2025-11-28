#! /bin/bash

currentWin=($(yabai -m query --windows --window | jq '.id, ."is-floating"'))
currentApp=$(yabai -m query --windows --window | jq '.app')
currentAppName=${currentApp//"\""/""}
winId=${currentWin[0]}
winIsFloat=${currentWin[1]}
apps=($(cat ~/.config/yabai/stop_list.txt))
for app in ${apps[@]}; do
	appName=${app//"~"/" "}
	if [[ "$currentAppName" == "$appName" && "$winIsFloat" == "false" ]]; then
		yabai -m window $winId --toggle float
	fi
done
