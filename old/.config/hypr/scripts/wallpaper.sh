#! /usr/bin/env bash
set -e


wallpaper_dir="$HOME/.config/hypr/wallpapers"


find "$wallpaper_dir" -type f \( -iname "*.jpg" -o -iname "*.png" \) -print0 | \
while IFS= read -r -d $'\0' file; do
  printf "%s\0icon\x1f%s\n" "$(basename "$file")" "$file"
done | rofi -dmenu -theme ~/.config/rofi/wallpaper.rasi | \
while IFS= read -r selected_wallpaper; do
  # if [[ -n "$selected_wallpaper" ]]; then
    # swww img "$wallpaper_dir/$selected_wallpaper" --transition-type=wipe --transition-angle=30 --transition-fps=165
    swww img "$wallpaper_dir/$selected_wallpaper" --transition-type "grow" --transition-pos "center" --transition-duration "2" --transition-fps "165"
  # fi
done
