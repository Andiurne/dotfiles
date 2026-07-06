{idle =
{
    behavior_order = [ "lock" "screen-off" "lock-and-suspend" ];
    behavior = {
        lock = {
            enabled = true;
            action = "lock";
            timeout = 300;
        };
        lock-and-suspend = {
            enabled = true;
            action = "lock_and_suspend";
            timeout = 600;
        };
        screen-off = {
            enabled = true;
            action = "screen_off";
            timeout = 360;
        };
    };
};
}
