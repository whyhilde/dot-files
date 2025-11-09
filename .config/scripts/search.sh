#! /usr/bin/env bash
set -e


SEARCH_ENGINES=(
  "󰣇  Arch Wiki:https://wiki.archlinux.org/index.php?search={query}"
  "󰣇  AUR:https://aur.archlinux.org/packages?K={query}"
  "󰥖  Perplexity:https://www.perplexity.ai/search?q={query}"
  "  GitHub:https://github.com/search?q={query}&type=repositories"
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
  # step 1: choosing search engine
  select_engine=$(show_engine_menu)
  if [ -z "$select_engine" ]; then
    exit 0
  fi
    
  # step 2: enter search query
  query=$(get_search_query "$select_engine")
  if [ -z "$query" ]; then
    exit 0
  fi
    
  # step 3: find URL for selected engine
  for item in "${SEARCH_ENGINES[@]}"; do
    if [[ "$item" == "$select_engine:"* ]]; then
      url_template="${item#*:}"
      break
    fi
  done
    
  # step 4: replacing {query} on actual query and open
  url="${url_template//\{query\}/$(echo "$query" | sed 's/ /+/g')}"
  xdg-open "$url"
}


main
