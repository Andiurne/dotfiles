{widget =
{
    date.format = "%a - %d %m";
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
        width = 188.0;
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

    battery.hide_when_plugged = true;
    bluetooth.hide_when_no_connected_device = true;
    tray.drawer = true;
    clock.format = "%H:%M:%S";
};
}
