#! /usr/bin/bash

xrandr --output None-1 --mode 1920x1080 --rate 165
setxkbmap us,ru -option grp:win_space_toggle
xset r rate 275 30
feh --bg-scale $HOME/dwm-finale/assets/wallpaper.png --no-fehbg
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
gsettings set org.gnome.desktop.interface font-name "JetBrains Mono NF Medium 12"
dwmblocks &
dwm
