{programs.umbriel.settings = {
    input = {
        middle_click_paste = false;

        keyboard = {
            layout = "us";
            variant = "altgr-intl";
            options = "";
        };

        touchpad = {
            tap = true;
            natural_scroll = true;
        };

        mouse = {
            natural_scroll = false;
            sensitivity = 0.0;
            scroll_wheel_step = 60;
        };

        cursor = {
            theme = "king-halo-xcur";
            size = 24;
            hardware_cursor = true;
            hide_when_typing = false;
            follows_focus = true;
        };

        focus = {
            follows_mouse = true;
        };
    };

    output = {
        # enchantedSlate integrated (eDP-1)
        "BOE 0x0B04 Unknown" = {
            mode = "2560x1600@60.002";
            scale = 1.0;
        };

        # Desk Monitor, by various names
        "Acer Technologies XV272U V3 A513088793LEJ" = {
            mode = "2560x1440@144";
            scale = 1.0;
        };
        "DP-3".position = [0 0];
        "HDMI-A-1".position = [2560 0];
    };
};}
