#! /bin/bash

source ~/.config/skhd/choose_default.sh

ls /Applications/ /Applications/Utilities/ /System/Applications/ /System/Applications/Utilities/ |
  grep '\.app$' |
  sed 's/\.app$//g' |
  choose_default -p "App" -f 'JetBrainsMono Nerd Font Mono' |
  xargs -I {} open -a "{}.app"
