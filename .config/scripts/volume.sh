#! /usr/bin/env bash
set -e


# icons
ICON="$HOME/.config/scripts/icons/volume.svg"
ICON_MUTED="$HOME/.config/scripts/icons/volume-mute.svg"


send_notification() {
  volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP "\d+(?=%)" | head -1)
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP "(yes|no)")

  if [ "$muted" = "yes" ]; then
    icon=$ICON_MUTED
    message="mute"
    progress=0
  else
    if [ $volume -ge 50 ]; then
      icon=$ICON
    else
      icon=$ICON
    fi
      message="$volume%"
      progress=$volume
  fi
    
  dunstify -h "int:value:$progress" -h "string:hlcolor:#88C0D0" \
    -i "$icon" "$message" -r 1234
}


case "$1" in
  up) pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
  down) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
  mute) pactl set-sink-mute @DEFAULT_SINK@ toggle ;;
esac


send_notification
