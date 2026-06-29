{pkgs, ...}: {
# For Noctalia
networking.networkmanager.enable = true;
hardware.bluetooth.enable = true;
services.power-profiles-daemon.enable = true;
services.upower.enable = true;

environment.systemPackages = with pkgs; [
    mpvpaper # Video wallpaper plugin
    emacsPackages.kaomoji # I *think* required for Kaomoji plugin?
];
}
