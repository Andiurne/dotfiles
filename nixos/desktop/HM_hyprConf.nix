{inputs, system, ...}:
{
    dconf.settings."org/gnome/desktop/interface" = {
        cursor-theme = "king-halo-xcur";
    };

    services.hyprpolkitagent.enable = false;

    /*imports = map (dir: ./hyprConf + dir) [
    /aesthetics.nix
    /config.nix
    /device.nix
    #/env.nix Shouldn't be necessary
    /events.nix
    /gesture.nix
    /keybinds.nix
    /luaVars.nix
    /monitor.nix
    /rules.nix
    ];*/
    disabledModules = ["services/window-managers/hyprland"];
    imports = [ (import ./altModule/ad_module.nix (builtins.getFlake "github:Andiurne/nixLuaUtils")) ];

    wayland.windowManager.hyprland = let
        hyprpkgs = inputs.hyprland.packages.${system};
        in {
	        enable = true;
		package = hyprpkgs.hyprland; #inputs.hyprland.packages.${sys}.hyprland;
	        portalPackage = hyprpkgs.xdg-desktop-portal-hyprland; #inputs.hyprland.packages.${sys}.xdg-desktop-portal-hyprland;
		systemd.enable = false;

                # Just require the hot-reloaded files
                # Theoretically I *could* port the lua conf into nix...
                # but like why?
                extraLua = ''
                hl.config({
                    misc = {
                        force_default_wallpaper = 0,
                        disable_hyprland_logo = false,
                    },
                    })
                require("scratchpad")
                require("noctalia").apply_theme()
                '';
    };
}
