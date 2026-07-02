{pkgs, inputs, config, ...}:
{
    dconf.settings."org/gnome/desktop/interface" = {
        cursor-theme = "king-halo-xcur";
    };

    services.hyprpolkitagent.enable = false;

    imports = map (dir: ./hyprConf + dir) [
    /config.nix
    /device.nix
    #/env.nix Shouldn't be necessary
    /events.nix
    /gesture.nix
    /keybinds.nix
    /luaVars.nix
    /monitor.nix
    /noctalia_conf.nix
    /rules.nix
    ];

    wayland.windowManager.hyprland = let
	        sys = pkgs.stdenv.hostPlatform.system;
        in {
	        enable = true;
		package = inputs.hyprland.packages.${sys}.hyprland;
		portalPackage = inputs.hyprland.packages.${sys}.xdg-desktop-portal-hyprland;
		systemd.enable = false;

                # Just require the hot-reloaded files
                # Theoretically I *could* port the lua conf into nix...
                # but like why?
                extraConfig = ''
                require("scratchpad")
                require("noctalia").apply_theme()
                '';
    };
}
