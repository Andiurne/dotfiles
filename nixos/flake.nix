{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

	noctalia = {
		url = "github:noctalia-dev/noctalia";
		inputs.nixpkgs.follows = "nixpkgs";
	};

	silentSDDM = {
		url = "github:uiriansan/SilentSDDM";
		inputs.nixpkgs.follows = "nixpkgs";
	};


        home-manager = {
          url = "github:nix-community/home-manager";
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
            # Don't follow nixpkgs actually

	snappy-switcher.url = "github:OpalAayan/snappy-switcher";

	hyprland.url = "github:hyprwm/Hyprland";

      };
    outputs = { self, nixpkgs,
    home-manager,
    ... } @ inputs:
	let
		hm_module = home-manager.nixosModules.home-manager;
	in{
	nixosConfigurations = {
	enchantedSlate = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {inherit inputs;};

		modules = [
			./mainConfig.nix

			hm_module
			./andiurne_HM/module.nix
		];
	};

        VC_station = nixpkgs.lib.nixosSystem {
           	system = "x86_64-linux";
        	specialArgs = { inherit inputs; };

        	modules = [
              		./mainConfig.nix
	      		./hardwareConf/VC_station.nix
			hm_module
			./devinr_HM/module.nix
           		];
          	};
        };
      };
}
