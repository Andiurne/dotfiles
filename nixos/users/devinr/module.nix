{inputs,...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.backupFileExtension = "bak";
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
	home-manager.users.devinr.imports = [./home.nix];
}
