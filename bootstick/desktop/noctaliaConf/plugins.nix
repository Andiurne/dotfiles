{plugins =
{
    enabled = [
        "noctalia/kaomoji"
        "noctalia/wallhaven"
        "noctalia/mpvpaper"
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
}
//
{plugin_settings =
{
    "noctalia/mpvpaper".video_directory = "~/Pictures/Wallpapers/animated";
    "noctalia/wallhaven".download_dir = "~/Pictures/Wallpapers/wallhaven";
};
}
