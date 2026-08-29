let
    umbriel = builtins.getFlake "git+https://github.com/noctalia-dev/umbriel?rev=be4e479ea82c3689b31c93a11bd6b26bafce373d";
in {pkgs, ...}:{
    imports = [
        umbriel.nixosModules.default
    ];

    environment.systemPackages = [
        pkgs.king-halo-xcur
        pkgs.wl-mirror
    ];

    programs.umbriel.enable = true;

    home-manager.users.andiurne.imports = [
        umbriel.homeModules.default
        {
            imports = [
                ../../HM_pointerCursor.nix

                ./binds.nix
                ./appearance.nix
                ./workspaces.nix
                ./rules.nix
                ./devices.nix
                ./layout.nix
                #./animation.nix
            ];
            programs.umbriel = {
                enable = true;
                settings = {
                    include.files = [
                        "noctalia.toml"
                    ];
                    general = {
                        autostart = [
                            "noctalia"
                            "steam -silent"
                            "openrgb --startminimized"
                            "equibop"
                            "wljoywake"
                            "wayland-pipewire-idle-inhibit"
                            "umbriel msg workspace-switch:2"
                        ];

                        focus_on_activate = false;
                        xwayland = true;
                        show_cheatsheet = false;
                    };
                };
            };
        }
    ];
}
