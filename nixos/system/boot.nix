{ config, pkgs, ...}:
{ 
  boot = {
    # Bootloader
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  
    # Latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
