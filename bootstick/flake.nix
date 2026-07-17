{
  description = "Personalized NixOS live environment";
  inputs =
  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
	    url = "github:nix-community/home-manager";
	    inputs.nixpkgs.follows = "nixpkgs";
    };

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
    };
    hyprland.url = "github:hyprwm/Hyprland";
    hmHyprLib.url = "github:Andiurne/hmHyprLib";

    lintree = {
      url = "path:./flakes/lintree";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, nixpkgs,
    home-manager,
    hmHyprLib,
    ...} @ inputs:
    {
      packages.x86_64-linux.default = self.nixosConfigurations.bootstick.config.system.build.isoImage;
      nixosConfigurations = {
        bootstick = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {inherit inputs; };
          modules =
          [
            ./mainConfig.nix
            ({pkgs, modulesPath, ...}: {
              imports =
              [
                (modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
              ];

              networking.hostName = "bootstick";
              # Install utils
              environment.systemPackages = with pkgs; [
                gparted
              ];
            })
            home-manager.nixosModules.home-manager
            ./user
	    ./overlays/bootstick.nix
          ];
      };
    };
  };
}
