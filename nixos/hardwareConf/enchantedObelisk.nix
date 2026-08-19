{pkgs, ...}:{
imports = [./enchantedObelisk_autogen.nix];
environment.systemPackages = with pkgs; [ openrgb ];
boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

fileSystems = {
  "/".options = [ "compress=zstd" ];
  "/home".options = [ "compress=lzo" ];
  "/nix".options = [ "compress=zstd" "noatime"];
  "/swap".options = [ "noatime" ];
};

swapDevices = [{
  device = "/swap/swapfile";
  size = 32*1024;
}];
}
