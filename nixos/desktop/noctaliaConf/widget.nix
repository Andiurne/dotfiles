{widget =
{
    tray.drawer = true;

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
    output_volume.scroll_step = 2;
    volume.show_label = false;
    brightness =
    {
        scroll_step = 2;
        show_label = false;
    };

    clock.format = "%I:%M %p";
    date.format = "%a - %d %m";
};
}
