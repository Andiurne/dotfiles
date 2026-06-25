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

	snappy-switcher.url = "github:OpalAayan/snappy-switcher";

hyprland.url = "github:hyprwm/Hyprland";

      };
    outputs = { self, nixpkgs,
    home-manager,
    ... } @ inputs:
	let
		#lib = nixpkgs.lib;
		#system = "x86_64-linux";
		hm_module = home-manager.nixosModules.home-manager;
		#pkgs = nixpkgs.legacyPackages.${system};
	in {
	nixosConfigurations = nixpkgs.lib.genAttrs
	[
	"enchantedSlate"
	"VC-station"
	]
  (hostName: nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./mainConfig.nix
			./hardwareConf/${hostName}.nix
			{ networking.hostName = hostName; }
			hm_module
			./users/${hostName}_userSet.nix
			./overlays/${hostName}.nix

		];
	});
      };
}
