kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/config.kdl".text = kdl.formats.v1 (
(map (cmd: (n "spawn-sh-at-startup" cmd)) [
    "noctalia"
    "steam -silent"
    "openrgb --starminimized"
    "wljoywake"
    "wayland-pipewire-idle-inhibit -w"
])
++ (map (path: (n "include" "${path}.kdl")) [
    "noctalia"
    "binds"
    "devices"
    "layout"
    "style"
    "workspaces"
]) ++ [
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
