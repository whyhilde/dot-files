-- MONITORS
hl.monitor({
  output = "Unknown-1",
  mode = "1920x1080@165",
  position = "auto",
  scale = "1",
})


-- AUTOSTART
hl.on("hyprland.start", function()
  hl.exec_cmd("waybar & awww-daemon")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme catppuccin-mocha-blue-standard+default")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono Medium 12'")
end)


-- ENVIRONMENT VARIABLES
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("HYPRCURSOR_SIZE", "24")


-- PERMISSIONS
hl.config({
  ecosystem = {
    enforce_permissions = false,
  },
})


-- LOOK AND FEEL
hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 5,
    border_size = 5,
    col = {
      active_border = {
        colors = {
          "rgba(83c092ff)",
          "rgba(a7c080ff)",
        },
        angle = 45,
      },
      inactive_border = "rgba(414b50ff)",
    },
    resize_on_border = false,
    allow_tearing = false,
    layout = "master",
  },
  decoration = {
    rounding = 0,
    rounding_power = 0,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = false,
    },
    blur = {
      enabled = false,
    },
  },
  animations = {
    enabled = true,
  },
})


-- ANIMATIONS
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- LAYOUTS
hl.config({
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
})

hl.config({
  master = {
    new_status = "master",
    mfact = 0.5,
    new_on_top = true,
  },
})

hl.config({
  scrolling = {
    fullscreen_on_one_column = true,
  },
})


-- MISC
hl.config({
  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = true,
  },
})


-- INPUT
hl.config({
  input = {
    kb_layout = "us,ru",
    kb_options = "grp:win_space_toggle",
    follow_mouse = 1,
    repeat_delay = 275,
    repeat_rate = 30,
    sensitivity = 0,
    touchpad = {
      natural_scroll = false,
    },
  },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-- KEYBINDINGS
local Mod = "SUPER"

hl.bind(Mod .. " + RETURN", hl.dsp.exec_cmd("alacritty"))
hl.bind(Mod .. " + C", hl.dsp.window.close())
-- hl.bind(Mod .. " + M", hl.dsp.exec_cmd(""))
hl.bind(Mod .. " + D", hl.dsp.exec_cmd("alacritty --title search -e python ~/.config/hypr/scripts/launcher.py"))
hl.bind(Mod .. " + X", hl.dsp.exec_cmd("alacritty --title search -e python ~/.config/hypr/scripts/powermenu.py"))
hl.bind(Mod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(Mod .. " + P", hl.dsp.window.pseudo())
hl.bind(Mod .. " + TAB", function()
  local layouts = {
    "dwindle",
    "master",
    "scrolling",
    "monocle",
  }
  local next_layout = "dwindle"

  for i = 1, #layouts do
    if layouts[i] == hl.get_config("general.layout") then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx]
      break
    end
  end

  hl.config({
    general = {
      layout = next_layout
    }
  })
end)
-- hl.bind(Mod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

local directions = {
  H = "left",
  J = "down",
  K = "up",
  L = "right",
}

for key, dir in pairs(directions) do
  hl.bind(Mod .. " + " .. key, hl.dsp.focus({ direction = dir }))
  hl.bind(Mod .. " + ALT + " .. key, hl.dsp.window.swap({ direction = dir }))
end

-- Move focus with Mod + arrow keys
-- hl.bind(Mod .. " + H", hl.dsp.focus({ direction = "left" }))
-- hl.bind(Mod .. " + J", hl.dsp.focus({ direction = "down" }))
-- hl.bind(Mod .. " + K", hl.dsp.focus({ direction = "up" }))
-- hl.bind(Mod .. " + L", hl.dsp.focus({ direction = "right" }))

-- Switch workspaces with Mod + [0-9]
-- Move active window to a workspace with Mod + SHIFT + [0-9]
for i = 1, 5 do
    -- local key = i % 10 -- 10 maps to key 0
    hl.bind(Mod .. " + " .. i  ,             hl.dsp.focus({ workspace = i}))
    hl.bind(Mod .. " + SHIFT + " ..   i,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(Mod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(Mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with Mod + scroll
hl.bind(Mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(Mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with Mod + LMB/RMB and dragging
hl.bind(Mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(Mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
  name = "launcher",
  match = { title = "search" },

    float = true,
  center = true,
   size = "720 440",
})
