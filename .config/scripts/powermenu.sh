#! /usr/bin/env bash
set -e


logout=""
shutdown="⏻"
reboot="󰜉"
suspend="󰒲"


chosen=$(echo -e "$logout\n$shutdown\n$reboot\n$suspend" | rofi -dmenu -theme ~/.config/rofi/powermenu.rasi)


case "$chosen" in
  "$logout") slock ;;
  "$shutdown") systemctl poweroff ;;
  "$reboot") systemctl reboot ;;
  "$suspend") systemctl suspend ;;
esac
