{
    bar.leftMain = {
        background_opacity = 1;
        capsule_thickness = 0.69999998807907104;
        center = [ "audio_visualizer" "group:g3" "audio_visualizer" ];
        end = [ "tray" "group:g2" ];
        margin_edge = 0;
        margin_ends = 0;
        padding = 10;
        position = "left";
        radius = 0;
        radius_bottom_left = 0;
        radius_bottom_right = 80;
        radius_top_left = 0;
        radius_top_right = 80;
        concave_edge_corners = true;
        start = [ "group:g1" "workspaces" ];
        thickness = 40;

        capsule_group =
        [
            {
                id = "g1";
                fill = "surface_variant";
                members = [ "date" "mpvpaper" "wallhaven"];
                opacity = 1.0;
                padding = 6.0;
            }
            {
                id = "g2";
                fill = "surface_variant";
                members = [ "battery" "bluetooth" "notifications" "clock"];
                opacity = 1.0;
                padding = 6.0;
            }
            {
                id = "g3";
                fill = "surface_variant";
                members = [ "brightness" "logo" "volume"];
                opacity = 1.0;
                padding = 6.0;
            }
        ];
    };
}
