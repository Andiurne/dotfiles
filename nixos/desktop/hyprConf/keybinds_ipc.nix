{addFlags, ipcBind}: [
# NOTE: ipcBind requires that cmd have a space in front
# so the concatenation within lua doesn't die... I think
(ipcBind "SUPER + comma" "settings-toggle")
(addFlags (ipcBind "SUPER + SUPER_L" "panel-toggle launcher") {special = "release";})
(ipcBind "SUPER + V" "panel-toggle clipboard")
(ipcBind "SUPER+ X" "panel-toggle control-center")
(ipcBind "SUPER+SHIFT + W" "panel-toggle wallpaper")
(ipcBind "SUPER+SHIFT + TAB" "panel-toggle launcher /win")

# Session
(ipcBind "SUPER + L" "session lock")
(ipcBind "SUPER+SHIFT + L" "session lock-and-suspend")
(ipcBind "CTRL+ALT+Delete" "panel-toggle session")

# Media
(ipcBind "SUPER + CONTROL + SPACE" "media toggle")
(addFlags (ipcBind "XF86AudioRaiseVolume"  "volume-up 2") {locked = true; repeating = true;})
(addFlags (ipcBind "XF86AudioLowerVolume"  "volume-down 2") {locked = true; repeating = true; })
(addFlags (ipcBind "XF86AudioMute"  "volume-mute") {locked = true;})
(ipcBind "XF86MonBrightnessUp"  "brightness-up")
(ipcBind "XF86MonBrightnessDown"  "brightness-down")
]
