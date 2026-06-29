{pkgs, inputs, ...}:
{
    dconf.settings."org/gnome/desktop/interface" = {
        cursor-theme = "king-halo-xcur";
    };

    services.hyprpolkitagent.enable = false;

    wayland.windowManager.hyprland = let
	        sys = pkgs.stdenv.hostPlatform.system;
        in {
	        enable = true;
		package = inputs.hyprland.packages.${sys}.hyprland;
		portalPackage = inputs.hyprland.packages.${sys}.xdg-desktop-portal-hyprland;
		systemd.enable = false;

                extraLuaFiles = {
                # Note: this is import syntax
                # The attribute name uses . as / in the final directory under XDG_CONFIG_HOME
                #"main" = {
                    # Lua file content, set either by specifying a path to a Lua file
                    # or by providing a multi-line Lua string.
                    #   content = ./hypr/main.lua;

                    # Whether to generate a require(...) call for this
                    # file in $XDG_CONFIG_HOME/hypr/hyprland.lua.
                    # Default = true;
                    #  autoLoad = true;
                    #};
      };
	};
}
