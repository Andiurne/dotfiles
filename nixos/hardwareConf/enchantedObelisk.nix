{pkgs, ...}:{
imports = [./enchantedObelisk_autogen.nix];
boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;


fileSystems = {
  "/".options = [ "compress=zstd" ];
  "/home".options = [ "compress=lzo" ];
  "/nix".options = [ "compress=zstd" "noatime"];
};

swapDevices = [{
  device = "/var/lib/swapfile";
  size = 32*1024;
}];

services.hardware.openrgb = {
  enable = true;
  motherboard = "amd";
  startupProfile = "Lilac";
};

# SSH Server
services.openssh = {
  enable = true;
  openFirewall = true;
  settings = {
    PasswordAuthentication = true;
    KbdInteractiveAuthentication = false;
    PermitRootLogin = "no";
    AllowUsers = [ "andiurne" ];
    MaxAuthTries = 3;
    PerSourcePenalties = "crash:3600s authfail:3600s max:86400s";
  };
};

# Remote Desktop
services.sunshine = {
  enable = true;
  autoStart = true;
  capSysAdmin = true;
  openFirewall = true;
};

users.users.andiurne.extraGroups = [ "uinput" ];
}
