#! /bin/bash
set -e


notify-send "Getting list of available Bluetooth devices..."


# Make sure Bluetooth is powered on
bluetoothctl power on

# Get a list of available Bluetooth devices
bt_list=$(bluetoothctl devices)

# Prepare device names properly
device_names=$(echo "$bt_list" | while read -r _ mac name; do
    echo "$name"
done)

# Check Bluetooth power state
powered=$(bluetoothctl show | grep -q "Powered: yes" && echo "on" || echo "off")

if [ "$powered" = "on" ]; then
    toggle="󰂲  Disable Bluetooth"
else
    toggle="󰂯  Enable Bluetooth"
fi

# Use rofi to select
chosen=$(echo -e "$toggle\n$device_names" | rofi -dmenu -config ~/.config/rofi/launcher.rasi -i -selected-row 1 -p " Blue ")

if [ -z "$chosen" ]; then
    exit
fi

# Handle toggle option
if [ "$chosen" = "󰂯  Enable Bluetooth" ]; then
    bluetoothctl power on
    notify-send "Bluetooth Enabled"
elif [ "$chosen" = "󰂲  Disable Bluetooth" ]; then
    bluetoothctl power off
    notify-send "Bluetooth Disabled"
else
    # Find MAC address for selected device
    chosen_mac=$(echo "$bt_list" | grep "$chosen" | awk '{print $2}')
    
    if [ -z "$chosen_mac" ]; then
        notify-send "Error" "Could not find MAC address for $chosen"
        exit 1
    fi

    # Pair and connect
    bluetoothctl pair "$chosen_mac"
    bluetoothctl trust "$chosen_mac"
    bluetoothctl connect "$chosen_mac"

    # Check connection status
    if bluetoothctl info "$chosen_mac" | grep -q "Connected: yes"; then
        notify-send "Connected" "Successfully connected to $chosen"
    else
        notify-send "Connection Failed" "Failed to connect to $chosen"
    fi
fi
