{config, lib, pkgs, modulesPath, self, ...}: {
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  }
