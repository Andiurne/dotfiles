{
  description = "NixOS config";

  inputs =
  {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    grub2-themes.url = "github:vinceliuice/grub2-themes";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    hyprland.url = "github:hyprwm/Hyprland";
    hmHyprLib.url = "github:Andiurne/hmHyprLib";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    nixvim.url = "github:nix-community/nixvim";

    home-manager = {
      url = "github:nix-community/home-manager";
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
    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    lintree = {
      url = "path:./flakes/lintree";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ani-cli-src = {
      url = "github:pystardust/ani-cli/fix";
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
      lib = nixpkgs.lib;
  in
  {
    packages.x86_64-linux.bootstick = self.nixosConfigurations.bootstick.config.system.build.isoImage;

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
	home-manager.nixosModules.home-manager
	grub2-themes.nixosModules.default
	sops-nix.nixosModules.sops
	./nixSettings.nix
	./system
	./desktop
	./hardwareConf/${hostName}.nix
	./users/${hostName}_userSet.nix
	./secrets/${hostName}.nix
	{
	networking.hostName = hostName;
	time.timeZone = "America/Los_Angeles";
	}
       ];
      });
  };
}
