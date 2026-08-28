let
    umbriel = builtins.getFlake "git+https://github.com/noctalia-dev/umbriel?rev=4473db4773225e5fb5c7f792afd5a756e4cb9016";
    noctalia-greeter = builtins.getFlake "github:noctalia-dev/noctalia-greeter/eefd43230b34ffbaa9267fede4d8aef1a784294a";
in {pkgs, ...}:{
    imports = [
        umbriel.nixosModules.default
        noctalia-greeter.nixosModules.default
    ];

    programs = {
        umbriel.enable = true;
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

    home-manager.users.andiurne.imports = [
        umbriel.homeModules.default
        ./umbriel.nix
    ];
}
