{pkgs, ...}:{
  imports = [
    ./enchantedSlate_autogen.nix
    ./nvidia.nix
  ];

  boot = {
    kernelParams = [ "ahci.mobile_lpm_policy=1" "noncq" ];
    kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
  };

  # SSH Client Config
  programs.ssh = {
    extraConfig = ''
    Host enchantedObelisk
      Hostname 10.108.1.23
      Port 22
      User andiurne
    '';
  };

  }
