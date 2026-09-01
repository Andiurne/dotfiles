{shell =
{
    launch_apps_as_systemd_services = true;
    polkit_agent = true;
    screen_time_enabled = true;
    settings_show_advanced = true;
    launcher = {
        app_grid = true;
        compact = true;
    };
    panel = {
        session_position = "center";
        transparency_mode = "glass";
    };
    screen_corners.enabled = true;
    screenshot.directory = "~/Pictures/Screenshots";

    session = {
        grid = true;
        show_shortcuts = true;
        grid_columns = 3;
        actions = [
            {
                shortcut = "S";
                action = "lock_and_suspend";
            }
            {
                shortcut = "L";
                variant = "primary";
                action = "lock";
            }
            {
                label = "Hibernate";
                shortcut = "H";
                glyph = "moon-stars";
                action = "command";
                command = "systemctl hibernate";
            }
            {
                shortcut = "R";
                action = "reboot";
            }
            {
                label = "Shutdown";
                shortcut = "Delete";
                glyph = "power";
                action = "command";
                variant = "destructive";
                command =
                ''
                sudo pkill openrgb;
                shutdown now;
                '';
            }
            {
                shortcut = "E";
                label = "Exit";
                action = "logout";
            }
        ];
    };
};
}
