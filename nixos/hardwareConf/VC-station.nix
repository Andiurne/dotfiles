{config, ...}: {
    imports = [
      ./VC-station_autogen.nix
    ];

    nixpkgs.config.nvidia.acceptLicense = true;
    hardware.nvidia = {
      open = false;
      package = config.boot.kernelPackages.nvidiaPackages.legacy_470;
    };

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
  }
