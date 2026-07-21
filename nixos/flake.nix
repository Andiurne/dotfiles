{
    description = "NixOS config";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
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
      };
    outputs = { self, nixpkgs,
    home-manager,
    grub2-themes,
    nix-cachyos-kernel,
    ... } @ inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
    in
	{
	  packages.${system}.bootstick = self.nixosConfigurations.bootstick.config.system.build.isoImage;

	  nixosConfigurations = lib.genAttrs
	  [
	    "enchantedSlate"
	    "VC-station"
	    "bootstick"
	  ]
	  (hostName: lib.nixosSystem {
	    specialArgs = { inherit inputs; };
	    modules =
	    [
	      ./nixSettings.nix
	      grub2-themes.nixosModules.default
	      ./system
	      ./desktop
	      ./hardwareConf/${hostName}.nix
	      ({pkgs, ...}: {
		nixpkgs = {
		  config.allowUnfree = true;
		  # Might need to compile locally sometimes, but is
		  # but is needed for config to apply to nixpkgs
		  overlays = [
		    nix-cachyos-kernel.overlays.default
		  ];
		};
		networking.hostName = hostName;
		boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
		time.timeZone = "America/Los_Angeles";
	      })
	      home-manager.nixosModules.home-manager
	      ./users/${hostName}_userSet.nix
	      ./overlays/${hostName}.nix
	      ./secrets/${hostName}.nix
	    ];
	  });
	  /* I don't feel like making this work, but I'll leave it here for now
	  nixosConfigurations.WSL = lib.nixosSystem {
	    specialArgs = { inherit inputs; };
	    modules =
	    [
	      ./mainConfig.nix
	      ./system
	      ./hardwareConf/WSL.nix
	      { networking.hostName = "WSL"; }
	      home-manager.nixosModules.home-manager
	      ./users/devinr
	      ./overlays/VC-station.nix
	    ];
	  };*/
      };
}
