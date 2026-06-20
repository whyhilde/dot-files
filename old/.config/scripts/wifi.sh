#! /usr/bin/env bash
set -e


ICON="$HOME/.config/scripts/icons/wifi.svg"
MENU="rofi -dmenu -config ~/.config/rofi/menu.rasi"


# load Network Manager, if service is not running
STATUS=$(ps aux | grep NetworkManager | grep root)
if [ "$STATUS" = "" ]; then
  $MENU -p " NET " | sudo -S NetworkManager
fi


# start scan of available broadcasting SSIDs
# nmcli dev wifi rescan
notify-send -i "$ICON" "Getting list of available Wi-Fi networks..."
LIST=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")


connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
  toggle="󰤭  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
  toggle="󰤨  Enable Wi-Fi"
fi


chosen_network=$(echo -e "$toggle\n$LIST" | uniq -u | $MENU -p " NET ")
chosen_id=$(echo "${chosen_network:3}" | xargs)


# parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
if [ "$chosen_network" = "" ]; then
  exit
elif [ "$chosen_network" = "󰤨  Enable Wi-Fi" ]; then
  nmcli radio wifi on
elif [ "$chosen_network" = "󰤭  Disable Wi-Fi" ]; then
  nmcli radio wifi off
else
  # message to show when connection is activated successfully
  success_message="You are now connected to the Wi-Fi network \"$chosen_id\""

  # get known connections
  saved_connections=$(nmcli -g NAME connection)

  if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
    nmcli connection up id "$chosen_id" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$success_message"
  else
    if [[ "$chosen_network" =~ "" ]]; then
      password="$MENU -p \" NET \""
    fi
    nmcli device wifi connect "$chosen_id" password "$password" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$success_message"
  fi
fi
