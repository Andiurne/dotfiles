{pkgs, config, ...}:{
    qt = {
        enable = true;
        style.package = with pkgs; [ darkly ];
        platformTheme.name = "qtct";
        qt6ctSettings = {
            Appearance = {
                color_scheme_path = config.xdg.configHome + "/qt6ct/colors/noctalia.conf";
                custom_palette = true;
                standard_dialogs = "default";
                style="Darkly";
                icon_theme="Papirus";
            };

            Fonts = {
                fixed = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0";
                general = "JetBrainsMono Nerd Font,10,-1,5,400,0,0,0,0,0,0,0,0,0,0,1,Regular,0,0";
            };
        };
    };
}
