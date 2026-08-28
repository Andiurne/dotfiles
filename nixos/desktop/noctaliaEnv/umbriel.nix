{
imports = [
    ./umbriel_binds.nix
    #./umbriel_workspaces.nix
    #./umbriel_colors.nix
    #./umbriel_appearance.nix
    #./umbriel_animation.nix
    #./umbriel_overview.nix
    #./umbriel_layout.nix
];
programs.umbriel = {
    enable = true;
    settings = {
        general = {
            autostart = [
                "noctalia"
                "steam -silent"
                "openrgb -startminimized"
                "wljoywake"
                "wayland-pipewire-idle-inhibit"
            ];

            xwayland = true;
            show_cheatsheet = false;
        };

        environment = {
            NIXOS_OZONE_WL = 1;
            ELECTRON_OZONE_PLATFORM_HINT = "auto";
        };
    };
};}
