{lib, pkgs, modulesPath, ...}: {
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  environment.systemPackages = with pkgs; [ gparted ];
  }
