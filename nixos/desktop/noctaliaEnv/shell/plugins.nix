{plugins =
{
    auto_update = "all";
    enabled = [
        "noctalia/kaomoji"
        "noctalia/wallhaven"
        "noctalia/mpvpaper"
        "noctalia/umbriel-companion"

        "yuuto/calculator"
        "nightwatch75/file-search"
        "mellotanica/launcher-pass"
        "h465855hgg/lyrics"
        "avivbintangaringga/nix-monitor"
        "weinguyen/shell-command"
        "cleboost/ssh-launcher"
        "nightwatch75/todo"
    ];
    source = [
        {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
        }
        {
            name = "community";
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
        }
    ];
};

plugin_settings = {
    "noctalia/mpvpaper".video_directory = "~/Pictures/Wallpapers/animated";
    "noctalia/wallhaven".download_dir = "~/Pictures/Wallpapers/wallhaven";
    "weinguyen/shell-command".default_workspace = "/home/andiurne";
    "avivbintangaringga/nix-monitor".update_command = "nix flake update --flake path:$XDG_CONFIG_HOME/dotfiles/nixos";
    };

widget = {
    nix-monitor.show_text = false;
};
}
