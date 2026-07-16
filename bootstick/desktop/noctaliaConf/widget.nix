{widget =
{
    date.format = "%a - %d %m";
    wallhaven.type = "noctalia/wallhaven:wallhaven";
    mpvpaper.type = "noctalia/mpvpaper:mpvpaper";

    logo =
    {
        command = "noctalia msg panel-toggle control-center";
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
        scroll_step = 2;
        show_label = false;
    };
    brightness =
    {
        scroll_step = 2;
        show_label = false;
    };

    battery.hide_when_plugged = true;
    bluetooth.hide_when_no_connected_device = true;
    tray.drawer = true;
    clock.format = "%I:%M %p";
};
}
