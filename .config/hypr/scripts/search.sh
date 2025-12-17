#! /usr/bin/env bash
set -e


SEARCH_ENGINES=(
  "󰣇  Wiki:https://wiki.archlinux.org/index.php?search={query}"
  "󰣇  Packages:https://archlinux.org/packages/?sort=&q={query}"
  "󰣇  AUR:https://aur.archlinux.org/packages?K={query}"
  "󰥖  Perplexity:https://www.perplexity.ai/search?q={query}"
  "󰇥  DuckDuckGo:https://duckduckgo.com/?t=ffab&q={query}"
  "  Google:https://www.google.com/search?q={query}"
  "  GitHub:https://github.com/search?q={query}&type=repositories"
  "  YouTube:https://www.youtube.com/results?search_query={query}"
)
MENU="rofi -dmenu -config ~/.config/rofi/config.rasi"


show_engine_menu() {
  printf "%s\n" "${SEARCH_ENGINES[@]%%:*}" | $MENU
}


get_search_query() {
  local engine="$1"
  $MENU
}


main() {
  # choosing search engine
  select_engine=$(show_engine_menu)
  if [ -z "$select_engine" ]; then
    exit 0
  fi
    
  # enter search query
  query=$(get_search_query "$select_engine")
  if [ -z "$query" ]; then
    exit 0
  fi
    
  # find URL for selected engine
  for item in "${SEARCH_ENGINES[@]}"; do
    if [[ "$item" == "$select_engine:"* ]]; then
      url_template="${item#*:}"
      break
    fi
  done
    
  # replacing {query} on actual query and open
  url="${url_template//\{query\}/$(echo "$query" | sed "s/ /+/g")}"
  xdg-open "$url"
}


main
