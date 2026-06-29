{pkgs, ...}:{
gtk = {
    /*cursorTheme = {
        name = "king-halo-xcur";
        size = 24;
        package = pkgs.king-halo-xcur;
    };*/

    gtk4 = {
        enable = true;

        extraCss = ''
        @import url("noctalia.css")
        '';

        theme = {
            name = "adw-gtk3-dark";
            package = pkgs.adw-gtk3;
        };

        iconTheme = {
            name = "Papirus-Dark";
        };

        font = {
            name = "Adwaita Sans 11";
        };
        colorScheme = "dark";
    };
};
}
