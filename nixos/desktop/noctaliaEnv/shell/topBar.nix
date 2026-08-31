{
    bar.top = {
        background_opacity = 0.60;
        start = [
            "group:g3" "workspaces"
        ];
        center = [
            "audio_visualizer" "group:g1" "audio_visualizer"
        ];
        end = [
            "tray" "bluetooth" "notifications" "battery" "group:g2"
        ];

        capsule_group = [
            {
                id = "g1";
                members = ["volume" "logo" "brightness"];
                opacity = 0.65;
            }
            {
                id = "g2";
                members = ["date" "weather"];
                opacity = 0.65;
            }
            {
                id = "g3";
                members = [ "clock" "monitor_control" "caffeine"];
                opacity = 0.65;
            }
        ];
    };
}
