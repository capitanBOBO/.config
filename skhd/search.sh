#!/usr/bin/env bash

declare -A PREFIXES

PREFIXES["-y"]="YouTube"
PREFIXES["-d"]="DuckDuckGo"
PREFIXES["-g"]="Google"

declare -A DICT

DICT["YouTube"]="https://www.youtube.com/results?search_query="
DICT["DuckDuckGo"]="https://www.duckduckgo.com/?q="
DICT["Google"]="https://google.com/search?q="

# STR=""
#
# for K in ${!DICT[@]}
# do
#   STR+="$K\n"
# done
# KEY=$(printf $STR | choose_base -p "Search WHERE" -f 'JetBrainsMono Nerd Font Mono')
#
# if [[ -z "$KEY" ]]; then
#   exit
# fi
INPUT=$(echo "" | choose -e -m -n 0 -p "Search WHAT")
PREFIX=$(echo $INPUT | cut -d " " -f1)
if [[ -v PREFIXES[$PREFIX] ]]; then
  WHERE=${PREFIXES[$PREFIX]}
  SEARCH=$(echo $INPUT | cut -d " " -f2-)
else
  WHERE=${PREFIXES["-d"]}
  SEARCH=$INPUT
fi
if [[ -z "$SEARCH" ]]; then
  exit
fi
QUERY=$(echo $SEARCH | sed 's/ /+/g')
# echo ${DICT[$KEY]}$QUERY
open ${DICT[$WHERE]}$QUERY
