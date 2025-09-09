#! /bin/bash
set -e


notify-send "Getting Bluetooth status..."


# check status of Bluetooth service
service_status=$(systemctl is-active bluetooth)


if [ "$service_status" != "active" ]; then

  # if service is not active, suggest launch it
  chosen=$(echo -e "󰂯  Enable Bluetooth Service\n󰅖  Cancel" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p " Bluetooth Service Stopped ")
    
  if [ "$chosen" = "󰂯  Enable Bluetooth Service" ]; then
    sudo systemctl start bluetooth
    sleep 2
    notify-send "Bluetooth service started"
  else
    exit
  fi
fi


# check Bluetooth power status
powered=$(bluetoothctl show 2>/dev/null | grep "Powered:" | grep -q "yes" && echo "on" || echo "off")
if [ "$powered" = "on" ]; then
  toggle="󰂲  Disable Bluetooth"
else
  toggle="󰂯  Enable Bluetooth"
fi


# if Bluetooth is enabled, get list of devices
if [ "$powered" = "on" ]; then
  bt_list=$(bluetoothctl devices 2>/dev/null || echo "")
  device_names=$(echo "$bt_list" | while read -r _ mac name; do
    echo "$name"
  done)
  menu_options="$toggle\n$device_names"
else
  menu_options="$toggle"
fi


# launch Rofi
chosen=$(echo -e "$menu_options" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -selected-row 0 -p "  ")


if [ -z "$chosen" ]; then
  exit
fi


# selection processing
if [ "$chosen" = "󰂯  Enable Bluetooth" ]; then

  # trying to turn on Bluetooth with error handling
  if bluetoothctl power on 2>&1 | grep -q "Failed"; then
    notify-send "Error" "Failed to enable Bluetooth. Try restarting service."
    restart_chosen=$(echo -e "󰁪  Restart Bluetooth Service\n󰅖  Cancel" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -p " Bluetooth Error ")
    if [ "$restart_chosen" = "󰁪  Restart Bluetooth Service" ]; then
      sudo systemctl restart bluetooth
      sleep 2
      bluetoothctl power on
      notify-send "Bluetooth restarted and enabled"
    fi
    
  else
    notify-send "Bluetooth Enabled"
  fi

elif [ "$chosen" = "󰂲  Disable Bluetooth" ]; then
  bluetoothctl power off
  notify-send "Bluetooth Disabled"

else

  # connecting to device
  chosen_mac=$(echo "$bt_list" | grep "$chosen" | awk '{print $2}')
  
  if [ -z "$chosen_mac" ]; then
    notify-send "Error" "Could not find MAC address for $chosen"
    exit 1
  fi

  if bluetoothctl connect "$chosen_mac" 2>/dev/null; then
    notify-send "Connected" "Successfully connected to $chosen"
  else
    notify-send "Connection Failed" "Failed to connect to $chosen"
  fi

fi
