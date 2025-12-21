<h1 align="center">whyhilde shell</h1>
<p align="center">
  <img src="https://img.shields.io/github/last-commit/whyhilde/dot-files?&style=for-the-badge&color=89dceb&labelColor=181825&logoColor=cdd6f4&logo=git">
  <img src="https://img.shields.io/github/stars/whyhilde/dot-files?style=for-the-badge&color=89dceb&labelColor=181825&logoColor=cdd6f4&logo=andela">
  <img src="https://img.shields.io/github/repo-size/whyhilde/dot-files?style=for-the-badge&color=89dceb&labelColor=181825&logoColor=cdd6f4&logo=protondrive">
</p>


<h2 align="center">overview</h2>

**whyhilde shell** delivers a modern Hyprland system designed to increase productivity and convenience.

<details>
    <summary>Software overview</summary>

| software                                       | description                       |
| ---------------------------------------------- | --------------------------------- |
| [Hyprland](https://github.com/hyprwm/Hyprland) | Dynamic tiling Wayland compositor |
| [Waybar](https://github.com/Alexays/Waybar)    | Highly customizable Wayland bar   |
| [Rofi](https://github.com/davatorium/rofi)     | Application launcher              |
| [Mako](https://github.com/emersion/mako)       | Notification daemon               |

</details>

<details>
    <summary>Developer software</summary>

| software                                          | description                                        |
| ------------------------------------------------- | -------------------------------------------------- |
| [Ghostty](https://github.com/ghostty-org/ghostty) | Fast terminal emulator                             |
| [Neovim](https://github.com/neovim/neovim)        | Code editor focused on extensibility and usability |
| [Fish](https://github.com/fish-shell/fish-shell)  | The user-friendly command line shell               |
| [Yazi](https://github.com/sxyazi/yazi)            | Blazing fast terminal file manager written in Rust |

</details>

<details>
    <summary>Repository layout</summary>

| directory   | description                             |
| ----------- | --------------------------------------- |
| /.config/   | software configuration                  |
| /browser/   | browser configuration                   |
| /home/      | home configurations                     |
| /builder/   | util for install shell                  |
| /previews/  | example screenshots used in this README |
| /LICENSE.md | license                                 |

</details>


<h2 align="center">features</h2>

- Beautiful and minimalistic system.
- Customizing software on the system.
- All hotkeys are honed for maximum productivity.
- A very lightweight system that consumes less than 1GB of memory.
- Automatic installation and configuration of all basic software for development.


<h2 align="center">previews</h2>

![preview1](previews/1.png)
![preview2](previews/2.png)
![preview3](previews/3.png)
![preview4](previews/4.png)


<h2 align="center">installation</h2>

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
python3 ./dot-files/builder/install.py
```

> [!WARNING]
> **The installation is complete. If you have any problems, read the following section.**


<h2 align="center">post-installation</h2>

**If there are any problems after installation, read [these](DOCS.md) instructions.**


<h2 align="center">hotkeys</h2>

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

**The other hotkeys are in `~/.config/hypr/modules/keybindings.conf`.**


<h2 align="center">license</h2>

© 2025 whyhilde - Licensed under the MIT License. See [LICENSE](LICENSE.md) for details.
