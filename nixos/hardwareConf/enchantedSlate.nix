{...}:{
  imports = [
    ./enchantedSlate_autogen.nix
    ./nvidia.nix
  ];

  boot.kernelParams = [ "ahci.mobile_lpm_policy=1" "noncq" ];
  }
