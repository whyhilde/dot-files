#! /usr/bin/env bash
set -e


declare -A mochaPalette=(
  ["rosewater"]="#f5e0dc"
  ["flamingo"]="#f2cdcd"
  ["pink"]="#f5c2e7"
  ["mauve"]="#cba6f7"
  ["red"]="#f38ba8"
  ["maroon"]="#eba0ac"
  ["peach"]="#fab387"
  ["yellow"]="#f9e2af"
  ["green"]="#a6e3a1"
  ["teal"]="#94e2d5"
  ["sky"]="#89dceb"
  ["sapphire"]="#74c7ec"
  ["blue"]="#89b4fa"
  ["lavender"]="#b4befe"
  ["text"]="#cdd6f4"
  ["subtext1"]="#bac2de"
  ["subtext0"]="#a6adc8"
  ["overlay2"]="#9399b2"
  ["overlay1"]="#7f849c"
  ["overlay0"]="#6c7086"
  ["surface2"]="#585b70"
  ["surface1"]="#45475a"
  ["surface0"]="#313244"
  ["base"]="#1e1e2e"
  ["mantle"]="#181825"
  ["crust"]="#11111b"
)


mochaOrder=(
  "rosewater"
  "flamingo"
  "pink"
  "mauve"
  "red"
  "maroon"
  "peach"
  "yellow"
  "green"
  "teal"
  "sky"
  "sapphire"
  "blue"
  "lavender"
  "text"
  "subtext1"
  "subtext0"
  "overlay2"
  "overlay1"
  "overlay0"
  "surface2"
  "surface1"
  "surface0"
  "base"
  "mantle"
  "crust"
)


printColorBlock() {
  local color_name=$1
  local color_hex=$2
  printf "\e[48;2;%d;%d;%dm      \e[0m  %-8s %s\n" \
    $(hexToRGB "$color_hex") "$(echo "$color_hex" | tr "[:lower:]" "[:lower:]")" "$color_name"
}


hexToRGB() {
  local hex=$(echo "$1" | tr -d "#")
  local r=$(printf "%d" 0x${hex:0:2})
  local g=$(printf "%d" 0x${hex:2:2})
  local b=$(printf "%d" 0x${hex:4:2})
  echo "$r $g $b"
}


showPalette() {
  local -n palette=$1
  local -n order=$2

  for color_name in "${order[@]}"; do
    if [[ -v palette["$color_name"] ]]; then
      printColorBlock "$color_name" "${palette[$color_name]}"
    fi
  done

  echo
}


showPalette mochaPalette mochaOrder
