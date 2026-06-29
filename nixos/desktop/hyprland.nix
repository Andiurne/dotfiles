{pkgs, ...}: {

    programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

    environment.systemPackages = with pkgs; [
        xdg-desktop-portal-gtk
        hyprcursor
        king-halo-xcur
    ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";

        HYPRCURSOR_THEME = "King Halo";
        HYPRCURSOR_SIZE = 32;
        XCURSOR_THEME = "king-halo-xcur";
        XCURSOR_SIZE = 32;

        QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    programs.uwsm.enable = true;
  }
