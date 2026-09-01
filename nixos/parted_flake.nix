{
  description = "NixOS configuration with flake-parts";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { flake-parts, nixpkgs, ...} @ inputs: flake-parts.lib.mkFlake { inherit inputs; }
  {
    # Define sensible modules as flake outputs?
    imports = [
      ./nixSettings.nix
      ./system
      ./desktop
      ./sops
    ];

    flake.nixosConfigurations = nixpkgs.lib.genAttrs
      [
	"enchantedSlate"
	"enchantedObelisk"
	"bootstick"
      ]
      (hostName: nixpkgs.lib.nixosSystem {
	specialArgs = { inherit inputs; };
	modules = [

	];
	});

    systems = [ "x86_64-linux" ];

    perSystem = {config, self', inputs', pkgs, system, ...}:{
      # Allows definition of system-specific attributes
      # without needing to declare the system explicitly!
      #
      # Quick rundown of the provided arguments:
      # - config is a reference to the full configuration, lazily evaluated
      # - self' is the outputs as provided here, without system. (self'.packages.default)
      # - inputs' is the input without needing to specify system (inputs'.foo.packages.bar)
      # - pkgs is an instance of nixpkgs for your specific system
      # - system is the system this configuration is for

      # system is omitted in perSystem
      packages = {
	ani-cli = pkgs.ani-cli.overrideAttrs (old: {
	  src = inputs.ani-cli-src;
	  version = "v4.15";
	  runtimeInputs = old.runtimeInputs ++ [ pkgs.botan3 ];
	});
      };
    };

  };
}
