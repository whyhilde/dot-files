#! /bin/bash
set -e


# search engines list
SEARCH_ENGINES=(
  "󰣇  Arch Wiki:https://wiki.archlinux.org/index.php?search={query}"
  "󰣇  AUR:https://aur.archlinux.org/packages?K={query}"
  "  Google:https://www.google.com/search?q={query}"
  "  GitHub:https://github.com/search?q={query}&type=repositories"
)


# function for displaying search engine selection menu
show_engine_menu() {
    printf "%s\n" "${SEARCH_ENGINES[@]%%:*}" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p "  "
}


# function for entering a query
get_search_query() {
    local engine="$1"
    rofi -dmenu -config ~/.config/rofi/launcher.rasi -p "  "
}


# main function
main() {

    # step 1: choosing search engine
    selected_engine=$(show_engine_menu)
    
    if [ -z "$selected_engine" ]; then
        exit 0
    fi
    
    # step 2: enter search query
    query=$(get_search_query "$selected_engine")
    
    if [ -z "$query" ]; then
        exit 0
    fi
    
    # step 3: find URL for selected engine
    for item in "${SEARCH_ENGINES[@]}"; do
        if [[ "$item" == "$selected_engine:"* ]]; then
            url_template="${item#*:}"
            break
        fi
    done
    
    # step 4: replacing {query} on actual query and open
    url="${url_template//\{query\}/$(echo "$query" | sed 's/ /+/g')}"
    xdg-open "$url"

}


main
