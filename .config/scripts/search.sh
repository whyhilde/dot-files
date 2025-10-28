#! /usr/bin/env bash
set -e


# search engines list
SEARCH_ENGINES=(
  "󰣇  Arch Wiki:https://wiki.archlinux.org/index.php?search={query}"
  "󰣇  AUR:https://aur.archlinux.org/packages?K={query}"
  "󰥖  Perplexity:https://www.perplexity.ai/search?q={query}"
  "  GitHub:https://github.com/search?q={query}&type=repositories"
)


# function for displaying search engine selection menu
showEngineMenu() {
  printf "%s\n" "${SEARCH_ENGINES[@]%%:*}" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p ""
}


# function for entering a query
getSearchQuery() {
  local engine="$1"
  rofi -dmenu -config ~/.config/rofi/launcher.rasi -p ""
}


# main function
main() {
  # step 1: choosing search engine
  selectEngine=$(showEngineMenu)
  if [ -z "$selectEngine" ]; then
    exit 0
  fi
    
  # step 2: enter search query
  query=$(getSearchQuery "$selectEngine")
  if [ -z "$query" ]; then
    exit 0
  fi
    
  # step 3: find URL for selected engine
  for item in "${SEARCH_ENGINES[@]}"; do
    if [[ "$item" == "$selectEngine:"* ]]; then
      urlTemplate="${item#*:}"
      break
    fi
  done
    
  # step 4: replacing {query} on actual query and open
  url="${urlTemplate//\{query\}/$(echo "$query" | sed 's/ /+/g')}"
  xdg-open "$url"
}


# run main function
main
