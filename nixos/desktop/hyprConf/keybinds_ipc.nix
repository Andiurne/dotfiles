{addFlags, ipcBind}: [
# NOTE: ipcBind requires that cmd have a space in front
# so the concatenation within lua doesn't die... I think
(ipcBind "mainMod" "comma" "settings-toggle")
(addFlags (ipcBind "mainMod" "SUPER_L" "panel-toggle launcher") {special = "release";})
(ipcBind "mainMod" "V" "panel-toggle clipboard")
(ipcBind "subMod" "X" "panel-toggle control-center")
(ipcBind "subMod" "W" "panel-toggle wallpaper")
(ipcBind "subMod" "TAB" "panel-toggle launcher /win")

# Session
(ipcBind "mainMod" "L" "session lock")
(ipcBind "subMod" "L" "session lock-and-suspend")
(ipcBind "CTRL+ALT+Delete" "" "panel-toggle session")

# Media
(ipcBind "mainMod" "CONTROL + SPACE" "media toggle")
(addFlags (ipcBind "XF86AudioRaiseVolume" "" "volume-up 2") {locked = true; repeating = true;})
(addFlags (ipcBind "XF86AudioLowerVolume" "" "volume-down 2") {locked = true; repeating = true; })
(addFlags (ipcBind "XF86AudioMute" "" "volume-mute") {locked = true;})
(ipcBind "XF86MonBrightnessUp" "" "brightness-up")
(ipcBind "XF86MonBrightnessDown" "" "brightness-down")
]
