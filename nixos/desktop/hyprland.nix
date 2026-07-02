{pkgs, inputs, ...}: {

    programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

    environment.systemPackages = with pkgs; [
        kitty
        xdg-desktop-portal-gtk
        hyprcursor
        king-halo-xcur
        qt6Packages.qt6ct
        papirus-icon-theme
        # Doesn't currently work, oh well
        #inputs.hyprqt6engine.packages.${stdenv.hostPlatform.system}.default
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        HYPRCURSOR_THEME = "King Halo";
        HYPRCURSOR_SIZE = 32;
        XCURSOR_THEME = "king-halo-xcur";
        XCURSOR_SIZE = 32;

        QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    programs.uwsm.enable = true;
  }
