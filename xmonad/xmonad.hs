import XMonad

import XMonad.Util.EZConfig 
import XMonad.Util.Ungrab

--XMobar
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

import XMonad.Hooks.EwmhDesktops

import XMonad.Operations --kill

main :: IO () 
main = xmonad $ ewmhFullscreen $ ewmh $ withEasySB (statusBarProp "xmobar ~/.config/xmonad/xmobarrc" (pure def)) defToggleStrutsKey $ myConfig

myConfig = def{
        modMask = mod4Mask,
        terminal = "st",
        normalBorderColor = "#000000",
        focusedBorderColor = "#3264a8"

}
  `removeKeysP` [
        ("M-S-c"), --default kill key
        ("M-S-KP_Enter"), --default key for spawning terminal
        ("M-q"), --default key for reloading xmonad
        ("M-S-q") --default key for killing xmonad

  ]
  `additionalKeysP`[
      ("M-f"  , spawn "firefox"), 
      ("M-q",  kill ), 
      ("M-S-x", restart "xmonad" True), 
      ("M-<Return>", spawn "st")
    ]
