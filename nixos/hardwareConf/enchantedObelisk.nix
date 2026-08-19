{pkgs, ...}:{
imports = [./enchantedObelisk_autogen.nix];
services.hardware.openrgb = {
  enable = true;
  motherboard = "amd";
};
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
}
