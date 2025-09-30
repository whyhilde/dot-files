#! /usr/bin/env bash
set -e


ICON="$HOME/.config/scripts/icons/wifi.svg"


# load Network Manager
network_status=$(ps aux | grep NetworkManager | grep root)


# if service is not running
if [ "$network_status" = "" ]; then
  rofi -dmenu -config ~/.config/rofi/launcher.rasi -p " root password:" | sudo -S NetworkManager
fi


# start scan of available broadcasting SSIDs
# nmcli dev wifi rescan
notify-send -i "$ICON" "Getting list of available Wi-Fi networks..."
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")


connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
	toggle="󰤭  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
	toggle="󰤨  Enable Wi-Fi"
fi


chosen_network=$(echo -e "$toggle\n$wifi_list" | uniq -u | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p "")
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
      wifi_password=$(rofi -dmenu -config ~/.config/rofi/launcher.rasi -p " password:")
    fi

    nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$success_message"
	
  fi

fi
