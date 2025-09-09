# import libraries
import os
from os import path
import libqtile.resources
from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import subprocess


# variables
mod = "mod4"
home = path.expanduser("~")
qconf = home + "/.config/qtile/"

terminal = "ghostty"
color_focus = "#74c7ec"
color_unfocus = "#1e1e2e"
wall = home + "/Desktop/wall-6.jpg"


# hotkeys
keys = [
   
  # switch window focus
  Key([mod], "h", lazy.layout.left()),
  Key([mod], "l", lazy.layout.right()),
  Key([mod], "j", lazy.layout.down()),
  Key([mod], "k", lazy.layout.up()),

  # move windows
  Key([mod, "mod1"], "h", lazy.layout.shuffle_left()),
  Key([mod, "mod1"], "l", lazy.layout.shuffle_right()),
  Key([mod, "mod1"], "j", lazy.layout.shuffle_down()),
  Key([mod, "mod1"], "k", lazy.layout.shuffle_up()),

  # change size of windows
  Key([mod, "control"], "h", lazy.layout.grow_left()),
  Key([mod, "control"], "l", lazy.layout.grow_right()),
  Key([mod, "control"], "j", lazy.layout.grow_down()),
  Key([mod, "control"], "k", lazy.layout.grow_up()),
  Key([mod], "n", lazy.layout.normalize()),

  # general hotkeys
  Key([mod], "Return", lazy.spawn(terminal)),
  Key([mod], "Tab", lazy.next_layout()),
  Key([mod], "c", lazy.window.kill()),
  Key([mod], "s", lazy.window.toggle_fullscreen()),
  Key([mod], "f", lazy.window.toggle_floating()),
  Key([mod, "mod1"], "r", lazy.reload_config()),
  Key([mod, "mod1"], "q", lazy.shutdown()),

  # volume control
  Key([], "XF86AudioRaiseVolume", lazy.spawn(home + "/.config/scripts/volume.sh up")),
  Key([], "XF86AudioLowerVolume", lazy.spawn(home + "/.config/scripts/volume.sh down")),
  Key([], "XF86AudioMute", lazy.spawn(home + "/.config/scripts/volume.sh mute")),

  # run software
  Key([mod], "d", lazy.spawn("rofi -show drun -config ~/.config/rofi/launcher.rasi")),
  Key([mod], "x", lazy.spawn(home + "/.config/scripts/powermenu.sh")),
  Key([mod], "w", lazy.spawn(home + "/.config/scripts/search.sh")),
  Key([mod, "mod1"], "f", lazy.spawn("nemo")),
  Key([mod, "mod1"], "p", lazy.spawn("pavucontrol --tab=3")),
  Key([mod, "mod1"], "m", lazy.spawn("ghostty -e cmus")),
  Key(["control", mod], "s", lazy.spawn("flameshot gui")),
  Key(["control", mod], "f", lazy.spawn("flameshot full")),

]


for vt in range(1, 8):
  keys.append(
    Key(["control", "mod1"], f"f{vt}", lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland")),
  )


# groups
groups = [
  Group("1", label="一"),
  Group("2", label="二", matches = [ Match(wm_class = "Telegram"), ]),
  Group("3", label="三", matches = [ Match(wm_class = "Navigator"), ]),
  Group("4", label="四", matches = [ Match(wm_class = "obsidian"), ]),
  Group("5", label="五", matches = [ Match(wm_class = "Blender"), ]),
  Group("6", label="六"),
  Group("7", label="七"),
]


for i in groups:
  keys.extend(
    [
      # super + group number - switch to group
      Key([mod], i.name, lazy.group[i.name].toscreen()),
      
      # super + alt + group number - move focused window to group
      Key([mod, "mod1"], i.name, lazy.window.togroup(i.name)),
    ]
  )


# layout settings
layouts = [
  layout.Columns(
    border_focus = color_focus,
    border_normal = color_unfocus,
    border_width = 3,
    margin = 8,
    border_on_single = True,
  ),
]


# default widget settings
widget_defaults = dict(
  font = "JetBrains Mono Medium",
  fontsize = 19,
  padding = 20,
)
extension_defaults = widget_defaults.copy()


# screen settings
screens = [
  Screen(
    top = bar.Bar(
      [
        widget.TextBox(
          text = "",
          font = "JetBrainsMono Nerd Font",
          foreground = "#89b4fa",
          padding = 25,
          mouse_callbacks = {
            "Button1": lazy.spawn("rofi -show drun -config ~/.config/rofi/launcher.rasi"),
          },
        ),
        widget.GroupBox(
          font = "Noto Sans CJK Bold",
          highlight_method = "line",
          active = "#cdd6f4",
          inactive = "#6c7086",
          block_highlight_text_color = "#89b4fa",
          highlight_color = ["#1e1e2e", "#1e1e2e"],
          this_current_screen_border = "#89b4fa",
          disable_drag = True,
          padding = 5,
        ),
        widget.Spacer(),
        widget.Spacer(),
        widget.Spacer(),
        widget.Wlan(
          interface = "wlan0",
          update_interval = 0.1,
          format = "󰤨",
          disconnected_message = "󰤭",
          foreground = "#89b4fa",
          mouse_callbacks = {
            "Button1": lazy.spawn(home + "/.config/scripts/wifi.sh"),
          },
        ),
        widget.Clock(
          format = "%d %B  %I:%M %p",
          foreground = "#cdd6f4",
        ),
        widget.TextBox(
          text = "⏻",
          font = "JetBrainsMono Nerd Font",
          foreground = "#f38ba8",
          mouse_callbacks = {
            "Button1": lazy.spawn(home + "/.config/scripts/powermenu.sh"),
          },
        ),
        widget.Systray(
          icon_size = 19,
        ),
        widget.Spacer(20),
      ],
      size = 35,
      background = "#1e1e2e",
      opacity = 1,
      margin = [10, 5, 5, 5],
      reserve = True,
    ),
    wallpaper = wall,
    wallpaper_mode = "fill",
    x11_drag_polling_rate = 165,
  ),
]


# drag floating layouts
mouse = [
  Drag([mod], "Button1", lazy.window.set_position_floating(), start = lazy.window.get_position()),
  Drag([mod], "Button3", lazy.window.set_size_floating(), start = lazy.window.get_size()),
  Click([mod], "Button2", lazy.window.bring_to_front()),
]
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
floats_kept_above = True
cursor_warp = False


floating_layout = layout.Floating(
  float_rules = [
    *layout.Floating.default_float_rules,
    Match(wm_class = "nemo"),
    Match(wm_class = "pavucontrol"),
  ],
  y = 0.5,
  x = 0.5,
  border_width = 0,
)


auto_fullscreen = True
focus_on_window_activation = "smart"
focus_previous_on_window_remove = False
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = None
wl_xcursor_size = 24


# autostart
@hook.subscribe.startup_once
def autostart():
  subprocess.run(["xrandr", "--output", "DP-2", "--mode", "1920x1080", "--rate", "165"])
  subprocess.run(["setxkbmap", "-layout", "us,ru", "-variant", "winkeys", "-option", "grp:win_space_toggle"])
  subprocess.run(["xset", "r", "rate", "250", "30"])
  subprocess.Popen("dunst &", shell = True)
  subprocess.Popen("picom --config ~/.config/picom/picom.conf -b", shell = True)


wmname = "LG3D"
