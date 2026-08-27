{pkgs, ...}:{
  imports = [
    ./enchantedSlate_autogen.nix
    ./disableNvidia.nix
  ];

  boot = {
    kernelParams = [ "ahci.mobile_lpm_policy=1" "noncq" ];
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  };

  }
