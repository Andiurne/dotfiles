{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
	  url = "github:nix-community/home-manager";
	  inputs.nixpkgs.follows = "nixpkgs";
        };
	noctalia = {
		url = "github:noctalia-dev/noctalia/cachix";
	};
	hyprland.url = "github:hyprwm/Hyprland";
	hmHyprLib.url = "github:Andiurne/hmHyprLib";
	millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
	silentSDDM = {
		url = "github:uiriansan/SilentSDDM";
		inputs.nixpkgs.follows = "nixpkgs";
	};

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
	ani-cli-src = {
	  url = "github:pystardust/ani-cli/fix";
	  flake = false;
	};
	grub2-themes.url = "github:vinceliuice/grub2-themes";

	agenix.url = "github:ryantm/agenix";
      };
    outputs = { self, nixpkgs,
    home-manager,
    grub2-themes,
    ... } @ inputs:
	{
	nixosConfigurations = nixpkgs.lib.genAttrs
	[
	"enchantedSlate"
	"VC-station"
	]
  (hostName: nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules =
		[
		  grub2-themes.nixosModules.default
		  ./mainConfig.nix
		  ./hardwareConf/${hostName}.nix
		  { networking.hostName = hostName; }
		  home-manager.nixosModules.home-manager
		  ./users/${hostName}_userSet.nix
		  ./overlays/${hostName}.nix
		  ./secrets/${hostName}.nix
		];
	});
      };
}
