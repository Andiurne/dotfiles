{simpleBind, pvarBind}:[
(pvarBind "mainMod" "T" "terminal")
(pvarBind "mainMod" "E" "fileManager")
(pvarBind "mainMod" "W" "browser")
(simpleBind "mainMod" "O" "app2unit -- obsidian")
#(simpleBind "mainMod" "G" "app2unit -- github-desktop")
(simpleBind "subMod" "C" "hyprpicker -a")

# SCREEN CAPTURE
(simpleBind "mainMod" "R" "fish -c screenrec-toggle")
(simpleBind "mainMod" "S" "fish -c screencap-region")
(simpleBind "subMod" "S" "fish -c screencap-window")
(simpleBind "Print" "" "fish -c screencap-screen")

(simpleBind "ALT + Tab" "" "snappy-switcher next --mod alt")
(simpleBind "mainMod" "TAB" "snappy-switcher next --workspace --mod super")
]
