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
	/*
	hypothetical genAttrs setup
	nixosConfigurations = nixpkgs.lib.genAttrs
	[
	"enchantedSlate"
	"VC-station"
	] (hostName: nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./mainConfig.nix
			./hardwareConf/${hostName}.nix
			{ networking.hostName = hostName; }
			hm_module
			./users/${hostName}_userSet.nix
		];
	});
	*/
	nixosConfigurations = {
	enchantedSlate = nixpkgs.lib.nixosSystem {
		system = "x86_64-linux";
		specialArgs = {inherit inputs;};

		modules = [
			./mainConfig.nix
			./hardwareConf/enchantedSlate.nix
			{ networking.hostName = "enchantedSlate"; }

			hm_module
			./users/andiurne/andiurne.nix
			./users/andiurne/module.nix
		];
	};

        VC_station = nixpkgs.lib.nixosSystem {
           	system = "x86_64-linux";
        	specialArgs = { inherit inputs; };

        	modules = [
              		./mainConfig.nix
	      		./hardwareConf/VC_station.nix
			{ networking.hostName = "VC_station";}

			hm_module
			./users/devinr/devinr.nix
			./users/devinr/module.nix
           		];
          	};
        };
      };
}
