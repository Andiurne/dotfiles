{
imports = map (path: ./umbriel${path}) [
    /binds.nix
    /appearance.nix
    /workspaces.nix
    /rules.nix
    /devices.nix
    #/layout.nix
    #/animation.nix
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
                "openrgb -startminimized"
                "equibop"
                "wljoywake"
                "wayland-pipewire-idle-inhibit"
                "umbriel msg workspace-switch:2"
            ];

            xwayland = true;
            show_cheatsheet = false;
        };
    };
};}
