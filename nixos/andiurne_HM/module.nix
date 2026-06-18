{inputs,...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.backupFileExtension = "backup";
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux"; };
	home-manager.users.andiurne.imports = [./home.nix];
}

