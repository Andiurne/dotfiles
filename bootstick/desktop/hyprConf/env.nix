{inputs, ...}:{wayland.windowManager.hyprland.settings.env =
with inputs.hmHyprLib.lib; [
(env "HYPRCURSOR_SIZE" "32")
(env "HYPRCURSOR_THEME" "King Halo")
(env "ELECRON_OZONE_PLATFORM_HINT" "auto")
]
;}
