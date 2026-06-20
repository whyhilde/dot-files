LIGHT_WALL="file://$HOME/wall.png"
DARK_WALL="file://$HOME/wall.png"

gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
gsettings set org.gnome.desktop.peripherals.keyboard delay 275

for i in {1..9}; do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

gsettings set org.gnome.desktop.background picture-uri $LIGHT_WALL
gsettings set org.gnome.desktop.background picture-uri-dark $DARK_WALL
