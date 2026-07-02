{...}:{wayland.windowManager.hyprland.settings.env =
let
	env = name: value: {_args = [name value];};
in
[
(env "HYPRCURSOR_SIZE" "32")
(env "HYPRCURSOR_THEME" "King Halo")
(env "ELECRON_OZONE_PLATFORM_HINT" "auto")
]
;}
