#!/bin/bash

# Получаем ширину экрана для текущего space
screen_width=$(yabai -m query --displays --display | jq '.frame.w')

current_padding=$(yabai -m query --windows --window | jq '.frame.x' | cut -d '.' -f1)
echo "Current padding is $current_padding"
if [ "$current_padding" -gt 5 ]; then
  echo "Detected side padding, set default padding..."
  yabai -m space --padding abs:5:5:5:5
else
  # Вычисляем отступ как 20% от ширины
  echo 'Setting side padding'
  padding=$(echo "$screen_width * 0.2" | bc | cut -d'.' -f1)

  yabai -m space --padding abs:5:5:$padding:$padding
fi
