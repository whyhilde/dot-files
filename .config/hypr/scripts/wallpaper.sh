#! /usr/bin/env bash
set -e


WALLS_DIR="$HOME/.config/hypr/wallpapers"
RANDOM_WALL=$(find "$WALLS_DIR" -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)

swww img "$RANDOM_WALL" --transition-type "grow" --transition-pos "center" --transition-duration "2" --transition-fps "165"
