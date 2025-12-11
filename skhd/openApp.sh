#! /bin/bash

ls /Applications/ /Applications/Utilities/ /System/Applications/ /System/Applications/Utilities/ |
  grep '\.app$' |
  sed 's/\.app$//g' |
  choose -p "App" -f 'JetBrainsMono Nerd Font Mono' |
  xargs -I {} open -a "{}.app"
