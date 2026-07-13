{shell =
{
    launch_apps_as_systemd_services = true;
    polkit_agent = true;
    screen_time_enabled = true;
    settings_show_advanced = true;
    launcher = {
        app_grid = true;
        session_search = true;
        compact = true;
    };
    panel = {
        session_placement = "floating";
        transparency_mode = "glass";
    };
    screen_corners.enabled = true;
    screenshot.directory = "~/Pictures/Screenshots";
};
}
