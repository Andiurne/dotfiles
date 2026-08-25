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

# Remote Desktop
services.sunshine = {
  enable = true;
  autoStart = true;
  capSysAdmin = true;
  openFirewall = true;
  /*applications = {
    env.path = "$(PATH):$(HOME)/.local/bin";
    apps = [
      {
        name = "Desktop";
        image-path = "desktop.png";
      }
      {
        name = "Steam Big Picture";
        detached = [
          "setsid steam steam://open/bigpicture"
        ];
        prep-cmd = [
          {
            do = "";
            undo = "setsid steam steam://close/bigpicture";
          }
        ];
        image-path = "steam.png";
      }
    ];
  };*/
};

users.users.andiurne.extraGroups = [ "uinput" ];
}
