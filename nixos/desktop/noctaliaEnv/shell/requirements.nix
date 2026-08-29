{pkgs, ...}: {
# For Noctalia
networking.networkmanager.enable = true;
hardware.bluetooth.enable = true;
services.power-profiles-daemon.enable = true;
services.upower.enable = true;


# Brightness Control with ddcutil
boot.kernelModules = [ "i2c-dev" ];
services.udev.extraRules = ''
    KERNEL =="i2c-[0-9]*", GROUP="i2c", MODE="0660"
'';

users.users.andiurne.extraGroups = [ "i2c" ];

environment.systemPackages = with pkgs; [
    ddcutil
    mpvpaper # Video wallpaper plugin
];
}
