{
    lockscreen_widgets = let
        dp-lockscreen = outName:
        {
            box_height = 0.0;
            box_width = 0.0;
            cx = 960.0;
            cy = 957.0;
            output = outName;
            rotation = 0.0;
            type = "login_box";
            settings =
            {
              background_color = "surface_variant";
              background_opacity = 0.88;
              background_radius = 12.0;
              input_opacity = 1.0;
              input_radius = 6.0;
              show_login_button = true;
            };
        };
    in
    {
        widget_order =
        [
            "lockscreen-login-box@DP-1"
            "lockscreen-login-box@DP-2"
        ];
        widget."lockscreen-login-box@DP-1" = dp-lockscreen "DP-1";
        widget."lockscreen-login-box@DP-2" = dp-lockscreen "DP-2";

};
}
