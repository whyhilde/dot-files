#!/bin/bash
set -e


# icons
ICON_UP="/usr/share/icons/Papirus-Dark/16x16/actions/audio-volume-high.svg"
ICON_DOWN="/usr/share/icons/Papirus-Dark/16x16/actions/audio-volume-low.svg"
ICON_MUTED="/usr/share/icons/Papirus-Dark/16x16/actions/player-volume-muted.svg"


send_notification() {
  volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | head -1)
  muted=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(yes|no)')
    
  if [ "$muted" = "yes" ]; then
    icon=$ICON_MUTED
    message="muted"
    progress=0
  else
    if [ $volume -ge 50 ]; then
      icon=$ICON_UP
    else
      icon=$ICON_DOWN
    fi
      message="$volume%"
      progress=$volume
  fi
    
  dunstify -h "int:value:$progress" -h "string:hlcolor:#88C0D0" \
    -i "$icon" "volume" "$message" -r 1234
}


case $1 in
  up)
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  down)
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  mute)
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
esac


send_notification
