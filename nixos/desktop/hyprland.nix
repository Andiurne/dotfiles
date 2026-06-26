{pkgs, ...}: {
    programs.hyprland = {
        enable = true;
        withUWSM = true;
      };

    environment.systemPackages = with pkgs; [ hyprcursor ];

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        HYPRCURSOR_THEME = "King Halo";
        HYPRCURSOR_SIZE = 24;

        QT_QPA_PLATFORMTHEME = "qt6ct";
    };

    programs.uwsm.enable = true;
  }
