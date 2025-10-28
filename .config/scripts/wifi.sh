#! /usr/bin/env bash
set -e


ICON="$HOME/.config/scripts/icons/wifi.svg"


# load Network Manager
STATUS=$(ps aux | grep NetworkManager | grep root)


# if service is not running
if [ "$STATUS" = "" ]; then
  rofi -dmenu -config ~/.config/rofi/launcher.rasi -p " root password:" | sudo -S NetworkManager
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


chosenNetwork=$(echo -e "$toggle\n$LIST" | uniq -u | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p "")
chosenID=$(echo "${chosenNetwork:3}" | xargs)


# parses the list of preconfigured connections to see if it already contains the chosen SSID. This speeds up the connection process
if [ "$chosenNetwork" = "" ]; then
  exit

elif [ "$chosenNetwork" = "󰤨  Enable Wi-Fi" ]; then
  nmcli radio wifi on

elif [ "$chosenNetwork" = "󰤭  Disable Wi-Fi" ]; then
  nmcli radio wifi off

else
  # message to show when connection is activated successfully
  successMessage="You are now connected to the Wi-Fi network \"$chosenID\""

  # get known connections
  savedConnections=$(nmcli -g NAME connection)

  if [[ $(echo "$savedConnections" | grep -w "$chosenID") = "$chosenID" ]]; then
    nmcli connection up id "$chosenID" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$successMessage"

  else
    if [[ "$chosenNetwork" =~ "" ]]; then
      password=$(rofi -dmenu -config ~/.config/rofi/launcher.rasi -p " password:")
    fi

    nmcli device wifi connect "$chosenID" password "$password" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$successMessage"
	
  fi

fi
