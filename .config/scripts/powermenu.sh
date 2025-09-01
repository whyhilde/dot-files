#! /bin/sh
set -e


rofi_cmd() {
  rofi -dmenu -theme ~/.config/rofi/powermenu.rasi
}


chosen=$(printf "⏻

" | rofi_cmd)


case "$chosen" in

  "⏻") poweroff ;;
  "") reboot ;;
  "") qtile cmd-obj -o cmd -f shutdown ;;

esac
