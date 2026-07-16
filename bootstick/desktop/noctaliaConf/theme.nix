{
wallpaper.default.path = "/home/nixos/Pictures/Wallpapers/background.png";
theme =
{
    mode = "dark";
    source = "wallpaper";
    wallpaper_scheme = "vibrant";
    templates = {
        builtin_ids =
        [
            "btop"
            "cava"
            "foot"
            "gtk3"
            "gtk4"
            "hyprland"
            "kitty"
            "qt"
        ];
        community_ids =
        [
            "zen-browser"
            "neovim"
            "discord"
            "steam"
            "yazi"
            "snappy-switcher"
            "hyprtoolkit"
        ];
    };
};}
