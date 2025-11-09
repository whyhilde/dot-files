#! /usr/bin/env bash
set -e


lock="  lock screen"
shutdown="  poweroff"
reboot="  reboot"
suspend="󰒲  suspend"
hibernate="  hibernate"


chosen=$(echo -e "$lock\n$shutdown\n$reboot\n$suspend\n$hibernate" | \
  rofi -dmenu -config ~/.config/rofi/menu.rasi -p " POWER ")


case "$chosen" in
  "$lock") hyprlock ;;
  "$shutdown") systemctl poweroff ;;
  "$reboot") systemctl reboot ;;
  "$suspend") systemctl suspend ;;
  "$hibernate") systemctl hibernate ;;
esac
