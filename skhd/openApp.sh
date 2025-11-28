#! /bin/bash

source ~/.config/aerospace/scripts/alias.sh

ls /Applications/ /Applications/Utilities/ /System/Applications/ /System/Applications/Utilities/ |
  grep '\.app$' |
  sed 's/\.app$//g' |
  choose_base -p "App" -f 'JetBrainsMono Nerd Font Mono' |
  xargs -I {} open -a "{}.app"
