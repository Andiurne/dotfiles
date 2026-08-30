{widget =
{
    date.format = "%a : %D |";
    wallhaven.type = "noctalia/wallhaven:wallhaven";
    mpvpaper.type = "noctalia/mpvpaper:mpvpaper";

    logo =
    {
        actions.left = "exec noctalia msg panel-toggle control-center";
        glyph = "line-dashed";
        type = "custom_button";
    };

    audio_visualizer =
    {
        color_2 = "secondary";
        show_when_idle = true;
        width = 256;
        bands = 28;
    };

    volume = {
        actions = {
            scroll_up = "volume-up 2%";
            scroll_down = "volume-down 2%";
        };
        show_label = false;
    };
    brightness =
    {
        actions = {
            scroll_up = "brightness-up 2%";
            scroll_down = "brightness-down 2%";
        };
        show_label = false;
    };

    monitor_control = {
        glyph = "user-screen";
        type = "custom_button";
        actions = {
            left = "exec fish -c mirror";
            middle = "exec umbriel msg dpms-off";
            right = "exec wdisplays";
        };
    };

    battery.hide_when_plugged = true;
    bluetooth.hide_when_no_connected_device = true;
    tray.drawer = true;
    clock.format = "%H:%M:%S";
};
}
