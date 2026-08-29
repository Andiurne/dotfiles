let
    noctalia-greeter = builtins.getFlake "github:noctalia-dev/noctalia-greeter/eefd43230b34ffbaa9267fede4d8aef1a784294a";
in {pkgs, ...}:{
    imports = [ noctalia-greeter.nixosModules.default ];
    programs = {
        noctalia-greeter = {
            enable = true;
            settings = {
                user.default = "andiurne";
                cursor = {
                    theme = "king-halo-xcur";
                    size = 24;
                    path = "${pkgs.king-halo-xcur}/share/icons";
                };
                keyboard = {
                    layout = "us";
                    variant = "altgr-intl";
                };
                appearance = {
                    scheme = "Synced";
                    password_style = "random";
                    hide_logo = true;
                    theme_mode = "dark";
                    font_family = "Fantasque";
                };
            };
        };
    };
}
