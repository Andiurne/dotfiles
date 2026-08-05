{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    hyprland.url = "github:hyprwm/Hyprland/v0.56.1";
    hmHyprLib.url = "github:Andiurne/hmHyprLib";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    nixvim.url = "github:nix-community/nixvim";

    personal.url = "github:andiurne/flakes";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    steam-presence = {
      url = "github:JustTemmie/steam-presence";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ani-cli-src = {
      url = "github:pystardust/ani-cli/master";
      flake = false;
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
	nixpkgs.follows = "nixpkgs";
	home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { self, nixpkgs,
    home-manager,
    grub2-themes,
    nix-cachyos-kernel,
    sops-nix,
    ... } @ inputs:
  let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
  in
  {
    packages.x86_64-linux = {
      hyprland = self.nixosConfigurations.enchantedSlate.config.programs.hyprland.package;
      bootstick = self.nixosConfigurations.bootstick.config.system.build.isoImage;
      ani-cli = pkgs.ani-cli.overrideAttrs (old: {
	src = inputs.ani-cli-src;
	version = "v4.15";
	runtimeInputs = old.runtimeInputs ++ [ pkgs.botan3 ];
      });
    };

    nixosConfigurations = lib.genAttrs
      [
	"enchantedSlate"
	"VC-station"
	"bootstick"
      ]
      (hostName: lib.nixosSystem {
       specialArgs = { inherit inputs system; };
       modules =
       [
	home-manager.nixosModules.home-manager
	grub2-themes.nixosModules.default
	sops-nix.nixosModules.sops
	./nixSettings.nix
	./system
	./desktop
	./hardwareConf/${hostName}.nix
	./users/${hostName}_userSet.nix
	./sops
	./secrets/${hostName}.nix
	{
	networking.hostName = hostName;
	time.timeZone = "America/Los_Angeles";
	}
       ];
      });
  };
}
