#! /usr/bin/env bash
set -e


lock=""
shutdown=""
reboot=""
suspend="󰒲"
hibernate=""


uptime=$(uptime -p | sed "s/up/uptime/")
chosen=$(echo -e "$lock\n$shutdown\n$reboot\n$suspend\n$hibernate" | \
  rofi -dmenu -config ~/.config/rofi/powermenu.rasi -p "$uptime")


case "$chosen" in
  "$lock") hyprlock ;;
  "$shutdown") systemctl poweroff ;;
  "$reboot") systemctl reboot ;;
  "$suspend") systemctl suspend ;;
  "$hibernate") systemctl hibernate ;;
esac
