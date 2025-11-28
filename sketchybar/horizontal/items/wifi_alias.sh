# WIFI_ALIAS=${sketchybar --querry default_menu_items | grep WiFi | sed }
WIFI_ALIAS="Пункт управления,WiFi"
wifi=(
  background.padding_right=-15
  label.drawing=off
	icon.drawing=off
	label.padding_left=0
	label.padding_right=0
	click_script="open -b com.apple.systempreferences /System/Library/PreferencePanes/Network.prefPane"
)

sketchybar --add alias "$WIFI_ALIAS" right \
          --set "$WIFI_ALIAS" "${wifi[@]}" \
          --subscribe "$WIFI_ALIAS" wifi_change
