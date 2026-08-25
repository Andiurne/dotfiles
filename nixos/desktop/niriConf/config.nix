kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/config.kdl".text = kdl.formats.v1 (
(map (cmd: (n "spawn-sh-at-startup" cmd)) [
    "noctalia"
    "steam -silent"
    "openrgb --starminimized"
    "wljoywake"
    "wayland-pipewire-idle-inhibit -w"
])
++ [
(n "include" "noctalia.kdl")
(n "include" "devices.kdl")
(n "include" "style.kdl")
(n "include" "workspaces.kdl")
(n "include" "layout.kdl")
(n "include" "binds.kdl")

(n "screenshot-path" "~/Pictures/Screenshots/%Y-%m-%d_%R.png")
(n "prefer-no-csd")

(n "environment" [
    (n "XDG_CONFIG_HOME" "/home/andiurne/.config")
])

(n "cursor" [
    (n "xcursor-theme" "king-halo-xcur")
    (n "xcursor-size" 32)
])

]);}
