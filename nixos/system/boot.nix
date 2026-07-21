{ config, pkgs, ...}:
{
  boot = {
    # Bootloader
    loader = {
      grub = {
        device = "nodev";
        enable = true;
        efiSupport = true;
        configurationLimit = 12;
      };
      grub2-theme = {
        enable = true;
        theme = "whitesur";
        icon = "whitesur";
        screen = "2k";
        splashImage = ../assets/backgrounds/mark_night.png;
        footer = true;
      };
      efi.canTouchEfiVariables = true;
    };

  };
}
