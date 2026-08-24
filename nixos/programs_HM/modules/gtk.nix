{pkgs, ...}:{
gtk = {
    enable = true;
    /*cursorTheme = {
        name = "king-halo-xcur";
        size = 24;
        package = pkgs.king-halo-xcur;
    };*/
    gtk3.extraCss = ''
    @import url("noctalia.css");
    '';
    gtk4.extraCss = ''
    @import url("noctalia.css");
    '';

    theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
    };

    iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
    };

    font = {
        name = "Adwaita Sans 11";
    };
    colorScheme = "dark";
};
}
