#! /usr/bin/env bash
set -e


current=$(hyprctl getoption general:layout | grep "str:" | sed "s/str: //")
if [ "$current" == "master" ]; then
  hyprctl keyword general:layout dwindle
else
  hyprctl keyword general:layout master
fi
