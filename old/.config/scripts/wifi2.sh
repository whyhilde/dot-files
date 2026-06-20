#! /usr/bin/env bash
set -e


DIVIDER="--------"
RESCAN_BUTTON="  Rescan"
BACK_BUTTON="Back"
MENU="rofi -dmenu -config ~/.config/rofi/menu.rasi"
ICON="$HOME/.config/scripts/icons/wifi.svg"


# load NetworkManager
network_status=$(ps aux | grep NetworkManager | grep root)


# if the service is not running
if [ "$network_status" = "" ]; then
  $MENU -password -p " PASS " | sudo -S NetworkManager
fi


# starts a scan of available broadcasting SSIDs
notify-send -i "$ICON" "Getting list of available Wi-Fi networks..."


# get active connection
active_network=$(nmcli device status | awk '{print $4}' | sed "/--/d" | sed "/(externally/d" | sed "/CONNECTION/d")
if [ "$active_network" = "" ]; then
  active_network="Not Found"
fi


wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed "s/  */ /g" | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")


# gives a list of known connections so we can parse it later
connected=$(nmcli -fields WIFI g)
if [[ "$connected" =~ "enabled" ]]; then
  toggle="󰤭  Disable Wi-Fi"
elif [[ "$connected" =~ "disabled" ]]; then
  toggle="󰤨  Enable Wi-Fi"
fi


choose_options="$toggle\n$RESCAN_BUTTON\n$DIVIDER\n$wifi_list"


# if wifi is disabled, then the options change
if [ "$wifi_list" = "" ]; then
  choose_options="$toggle"
fi


chosen_network=$(echo -e "$choose_options" | uniq -u | $MENU -selected-row 0 -p " NET " )
chosen_id=$(echo "${chosen_network:3}" | xargs)


# parses the list of preconfigured connections to see if it already contains the chosen ssid. this speeds up the connection process
if [ "$chosen_network" = "" ]; then
  exit
elif [ "$chosen_network" = "󰤨  Enable Wi-Fi" ]; then
  nmcli radio wifi on
elif [ "$chosen_network" = "󰤭  Disable Wi-Fi" ]; then
  nmcli radio wifi off
elif [ "$chosen_network" = "$RESCAN_BUTTON" ]; then
  notify-send -i "$ICON" "Device rescan started..."
  nmcli radio wifi off && nmcli radio wifi on && sleep 3 && sh "$HOME/.config/scripts/wifi2.sh"
else
  # message to show when connection is activated successfully
  success_message="You are now connected to the Wi-Fi network \"$chosen_id\"."
  # get known connections
  saved_connections=$(nmcli -g NAME connection)
  if [[ $(echo "$saved_connections" | grep -w "$chosen_id") = "$chosen_id" ]]; then
    # display information about the currently selected device
    modified_id=$(echo "$chosen_id" | tr -d '[:space:]' | awk '{print tolower($0)}')
    connection_info=$(nmcli --fields "SSID,BSSID,MODE,FREQ,RATE,SECURITY" device wifi list | sed "s/$chosen_id/$modified_id/" | awk -v chosen_id="$modified_id" '$1 == chosen_id {print "BS:", $2, "\nMODE:", $3, "\nFREQ:", $4, $5, "\nRATE:", $6, $7, "\nSECURITY:", $8}')

    # processing logic in connection information
    wifi_details_options="$connection_info\n$DIVIDER\nChange password\nForget access point\nShare connection\n$BACK_BUTTON"
    chosen="$(echo -e "$wifi_details_options" | uniq -u | $MENU -selected-row 0 -p "$chosen_id")"
    echo $chosen

    case "$chosen" in

      "Change password")
        new_password=$($MENU -password -p " PASS ")
        nmcli con modify "$chosen_id" wifi-sec.psk "$new_password"
        notify-send -i "$ICON" "The password for point $chosen_id has been changed."
      ;;

      "Forget access point")
        nmcli connection delete $chosen_id
        notify-send "The $chosen_id access point was forgotten."
      ;;

      "Back")
        $HOME/.config/scripts/wifi2.sh
      ;;

      "Share connection")
        ghostty -e sh -c "nmcli dev wifi show-password; read -n 1 -s -r -p \"Press any key to exit\""
      ;;

      *)
        :
      ;;

    esac

    nmcli connection up id "$chosen_id" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$success_message"

  else
    if [[ "$chosen_network" =~ "" ]]; then
      wifi_password=$($MENU -password -p " PASS " )
    fi
    nmcli device wifi connect "$chosen_id" password "$wifi_password" | grep "successfully" && notify-send -i "$ICON" "Connection Established" "$success_message"
  fi
fi
