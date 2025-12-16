#! /bin/zsh

source ~/.config/skhd/choose_default.sh

SOURCES=("${(@f)$(SwitchAudioSource -a -t output -f json | jq  -r '"\(.id)\t\t\(.name)"')}")

SELECTED_SOURCE_ID=$(printf "%s\n" "${SOURCES[@]}" | choose_default -p "Audio OUTPUT" | cut -f 1)

SwitchAudioSource -i $SELECTED_SOURCE_ID
