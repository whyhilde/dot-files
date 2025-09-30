<h1 align="center"> WHYHILDE RICE </h1>
<p align="center">
  <img src="https://img.shields.io/github/last-commit/whyhilde/dot-files?&style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/issues/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/stars/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/repo-size/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/license/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
</p>


## 📖 INFO

| Distro                     | Arch Linux                                              |
| -------------------------- | ------------------------------------------------------- |
| Window Manager             | [Xmonad](https://xmonad.org/)                           |
| Bar                        | [Polybar](https://github.com/polybar/polybar)           |
| Compositor                 | [Picom](https://github.com/pijulius/picom)              |
| App Launcher and Powermenu | [Rofi](https://github.com/davatorium/rofi)              |
| Display Manager            | [Sddm](https://github.com/sddm/sddm)                    |
| Notification               | [Dunst](https://github.com/dunst-project/dunst)         |
| Browser                    | [Firefox](https://github.com/topics/firefox-browser)    |
| Terminal                   | [Ghostty](https://ghostty.org/)                         |
| Shell                      | [Zsh](https://www.zsh.org/)                             |
| Code Editor                | [Neovim](https://github.com/neovim/neovim)              |
| Fetch                      | [fastfetch](https://github.com/fastfetch-cli/fastfetch) |
| Visualiser                 | [Cava](https://github.com/karlstav/cava)                |


## :rocket: FEATURES

- Beautiful and minimalistic system.
- Customizing software on the system.
- All hotkeys are honed for maximum productivity.
- A very lightweight system that consumes less than 1GB of memory.
- Automatic installation and configuration of all basic software for development.


## 📸 SCREENSHOTS

![](.demo/1.png)
![](.demo/2.png)
![](.demo/3.png)
![](.demo/4.png)
![](.demo/5.png)
![](.demo/6.png)
![](.demo/7.png)


## :wrench: INSTALLATION

### :warning: WARNING
This installation script only works on Arch Linux.
This Configuration is designed for 1920X1080 monitors, some functionality of the shell may not work as it should. In this case you need to make adjustments manually.
If you find errors in the shell, please report the problem.

### STEPS

**1. install python and curl:**

```bash
sudo pacman -S python curl
```

**2. download builder script:**

```bash
curl -O https://raw.githubusercontent.com/whyhilde/dot-files/master/install.py
```

**3. run builder:**

```bash
python ./install.py
```


## :computer: HOTKEYS

| Action                                 | Key                   |
| -------------------------------------- | --------------------- |
| Move window focus                      | super + j/k           |
| Move focus window                      | super + alt + j/k     |
| Switch to another workspace            | super + 1/7           |
| Move window to another workspace       | super + alt + 1/7     |
| Kill focused window                    | super + c             |
| Toggle floating mode of focused window | super + f             |
| Open terminal                          | super + enter         |
| Open application launcher              | super + d             |
| Open power menu                        | super + x             |
| Restart Xmonad                         | super + alt + r       |
| Take screenshot                        | ctrl + super + s      |
| Take fullscreen screenshot             | ctrl + super + f      |

The other hotkeys are in ~/.config/xmonad/xmonad.hs.
