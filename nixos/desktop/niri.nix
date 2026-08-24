{inputs, pkgs, ...}:
{
    #@nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri = {
        enable = true;
        useNautilus = false;
        };
    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";

        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qt6ct";
    };
    environment.systemPackages = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
        xwayland-satellite
        king-halo-xcur

        # Idle Inhibit
        wljoywake
        wayland-pipewire-idle-inhibit
        wlinhibit
    ];
    home-manager.users.andiurne.imports = [ ./HM_niri.nix ];
}
