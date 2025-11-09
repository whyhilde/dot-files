<h1 align="center"> WHYHILDE RICE </h1>
<p align="center">
  <img src="https://img.shields.io/github/last-commit/whyhilde/dot-files?&style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/issues/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/stars/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/repo-size/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
  <img src="https://img.shields.io/github/license/whyhilde/dot-files?style=for-the-badge&color=89b4fa&logoColor=cdd6f4&labelColor=1e1e2e">
</p>


## :blue_book: INFO

| Distro             | [Arch Linux](https://archlinux.org/)                    |
| ------------------ | ------------------------------------------------------- |
| Wayland Compositor | [Hyprland](https://github.com/hyprwm/Hyprland)          |
| Status Bar         | [Waybar](https://github.com/Alexays/Waybar)             |
| App Launcher       | [Rofi](https://github.com/davatorium/rofi)              |
| Notifications      | [Dunst](https://github.com/dunst-project/dunst)         |
| Browser            | [Firefox](https://github.com/topics/firefox-browser)    |
| Terminal           | [Ghostty](https://github.com/ghostty-org/ghostty)       |
| Shell              | [Fish](https://github.com/fish-shell/fish-shell)        |
| Code Editor        | [Neovim](https://github.com/neovim/neovim)              |
| Fetch              | [Fastfetch](https://github.com/fastfetch-cli/fastfetch) |


## :rocket: FEATURES

- Beautiful and minimalistic system.
- Customizing software on the system.
- All hotkeys are honed for maximum productivity.
- A very lightweight system that consumes less than 1GB of memory.
- Automatic installation and configuration of all basic software for development.


## :camera: SCREENSHOTS

![preview1](.demo/1.png)
![preview2](.demo/2.png)
![preview3](.demo/3.png)
![preview4](.demo/4.png)
![preview5](.demo/5.png)


## :wrench: INSTALLATION

> [!WARNING]
> **This installation script only works on Arch Linux.**
> **This Configuration is designed for 1920X1080 monitors, some functionality of the shell may not work as it should. In this case you need to make adjustments manually.**
> **If you find errors in the shell, please report the problem.**

### :bulb: STEPS

**1. install python3 and git:**

```bash
sudo pacman -S python3 git
```

**2. clone repo:**

```bash
git clone https://github.com/whyhilde/dot-files
```

**3. run installer:**

```bash
cd dot-files && python3 ./install.py
```

> [!INFO]
> **The installation is complete. If you have any problems, read the following section.**


## :hammer: POST-INSTALLATION FIXES

**If you have a NVIDIA graphics card:**
- Open `/etc/mkinitcpio.conf`.
- In the `MODULES` array add the following modules names:
    - `MODULES=(i915 nvidia nvidia_modeset nvidia_uvm nvidia_drm ...)`.
- You can then rebuild the initramfs with `sudo mkinitcpio -P`, and reboot.

**If you don't have a NVIDIA graphics card:**
- Install the drivers for your graphics card ([Intel](https://wiki.archlinux.org/title/Intel_graphics), [AMD](https://wiki.archlinux.org/title/AMDGPU)).


## :computer: HOTKEYS

| Action                                 | Key                   |
| -------------------------------------- | --------------------- |
| Move window focus                      | Super + H/J/K/L       |
| Move focus window                      | Super + Alt + H/J/K/L |
| Switch to another workspace            | Super + 1/7           |
| Move window to another workspace       | Super + Alt + 1/7     |
| Kill focused window                    | Super + C             |
| Toggle floating of focused window      | Super + F             |
| Toggle fullscreen of focused window    | Super + S             |
| Open terminal                          | Super + ENTER         |
| Open application launcher              | Super + D             |
| Reload config                          | Super + Alt + R       |
| Take screenshot                        | Ctrl + Super + S      |
| Take fullscreen screenshot             | Ctrl + Super + F      |

**The other hotkeys are in ~/.config/hypr/hyprland.conf.**
