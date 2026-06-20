-- import libraries --
import XMonad
import XMonad.Core
import XMonad.Util.EZConfig
import qualified Data.Map as M

import XMonad.Hooks.EwmhDesktops
import qualified XMonad.StackSet as W
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers

import XMonad.Layout.BinarySpacePartition

import XMonad.Actions.WithAll
import XMonad.Actions.FloatSnap
import XMonad.Layout.ToggleLayouts

import XMonad.Util.SpawnOnce
import XMonad.Util.Cursor
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps


-- variables --
myTerminal = "ghostty"
restartCmd = "xmonad --recompile && xmonad --restart"
colorFocused = "#89b4fa"
colorNormal = "#313244"
screenGaps = gaps [(U, 8), (D, 8), (L, 8), (R, 8)]
windowSpacing = spacing 8


-- functions --
toggleFloat :: Window -> X ()
toggleFloat w = windows (\s -> if M.member w (W.floating s)
  then W.sink w s
  else W.float w (W.RationalRect 0.25 0.25 0.5 0.5) s)


-- layouts configuration --
myLayout = toggleLayouts (noBorders Full) $ avoidStruts $ screenGaps $ windowSpacing $ tile ||| Mirror tile ||| bsp
  where
    tile = Tall 1 (3/100) (1/2)
    bsp = emptyBSP


-- window rules --
myManageHook = composeAll
  [

      isDialog --> doCenterFloat

    , className =? "TelegramDesktop" --> doShift "2"
    , className =? "firefox" --> doShift "3"
    , className =? "obsidian" --> doShift "4"
    , className =? "Blender" --> doShift "5"

    , className =? "Nemo" --> doCenterFloat
    , className =? "pavucontrol" --> doCenterFloat

    , className =? "Polybar" --> doIgnore

  ]


-- autostart --
myStartupHook :: X ()
myStartupHook = do
  spawnOnce "xrandr --output DP-2 --mode 1920x1080 --rate 165"
  spawnOnce "setxkbmap -layout us,ru -variant winkeys -option grp:win_space_toggle"
  spawnOnce "xset r rate 250 30"
  spawnOnce "dunst &"
  spawnOnce "polybar topbar &"
  spawnOnce "picom --config ~/.config/picom/picom.conf -b"
  spawnOnce "feh --bg-fill --no-fehbg ~/.config/xmonad/wall.png"
  setDefaultCursor xC_left_ptr
  setWMName "XMonad"


-- main config --
myConfig = def 
  {

      modMask = mod4Mask
    , terminal = myTerminal
    
    , borderWidth = 3
    , normalBorderColor = colorNormal
    , focusedBorderColor = colorFocused
    , focusFollowsMouse = False
    , clickJustFocuses = True
    , workspaces = ["1", "2", "3", "4", "5", "6", "7"]
    
    , layoutHook = myLayout
    , manageHook = manageDocks <+> myManageHook <+> manageHook def
    , startupHook = myStartupHook

  }

  `removeKeys` [

      (mod4Mask, xK_space)
    , (mod4Mask, xK_q)
    , (mod4Mask, xK_t)
    , (mod4Mask .|. shiftMask, xK_c)
    , (mod4Mask .|. shiftMask, xK_j)
    , (mod4Mask .|. shiftMask, xK_k)
    , (mod4Mask .|. shiftMask, xK_q)

  ]

  `additionalKeysP` [
  
    -- general hotkeys
      ("M-<Return>", spawn myTerminal)
    , ("M-c", kill)
    , ("M-M1-c", killAll)
    , ("M-m", windows W.focusMaster)
    , ("M-f", withFocused toggleFloat)
    , ("M-s", sendMessage ToggleLayout)
    , ("M-v", sendMessage NextLayout)
    , ("M-M1-r", spawn restartCmd)

    -- move windows
    , ("M-M1-j", windows W.swapDown)
    , ("M-M1-k", windows W.swapUp)

    -- change size of windows
    , ("M-h", sendMessage Shrink)
    , ("M-l", sendMessage Expand)

    -- launch software
    , ("M-d", spawn "rofi -show drun -config ~/.config/rofi/launcher.rasi")
    , ("M-g", spawn "~/.config/scripts/search.sh")
    , ("M-x", spawn "~/.config/scripts/powermenu.sh")
    , ("M-w", spawn "~/.config/scripts/wifi.sh")
    , ("M-b", spawn "~/.config/scripts/bluetooth.sh")
    , ("M-M1-f", spawn "nemo")
    , ("M-M1-l", spawn "slock")
    , ("M-M1-v", spawn "pavucontrol --tab=1")
    , ("C-M-s", spawn "flameshot gui")
    , ("C-M-f", spawn "flameshot full")
    , ("C-M-c", spawn "gpick --single")

    -- volume control
    , ("<XF86AudioRaiseVolume>", spawn "~/.config/scripts/volume.sh up")
    , ("<XF86AudioLowerVolume>", spawn "~/.config/scripts/volume.sh down")
    , ("<XF86AudioMute>", spawn "~/.config/scripts/volume.sh mute")

  ]

  `additionalKeys` []
  ++ [((m .|. mod4Mask, k), windows $ f i)
    | (i, k) <- zip (workspaces def) [xK_1 .. xK_7]
    , (f, m) <- [(W.greedyView, 0), (W.shift, mod1Mask)]]


main :: IO ()
main = xmonad
  . ewmhFullscreen 
  . ewmh
  . docks
  $ myConfig
