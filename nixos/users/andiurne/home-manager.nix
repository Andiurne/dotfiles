{inputs, system, ...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.backupFileExtension = "bak";
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = { inherit inputs system; };
	home-manager.users.andiurne.imports = [
	./hm-conf.nix
	];
	home-manager.sharedModules = [
		inputs.sops-nix.homeManagerModules.sops
	];
}
