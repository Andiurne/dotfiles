{inputs, system, ...}: {
	home-manager.useGlobalPkgs = true;
	home-manager.backupFileExtension = "bak";
	home-manager.useUserPackages = true;
	home-manager.extraSpecialArgs = { inherit inputs system; };
	home-manager.users.andiurne.imports = [
		({config, inputs, pkgs, ...}: {
			imports = map (x: ../hm-modules + x ) [
			  # Shadows
			  /yazi.nix
			  /fish

			  # Locals
			  /equibop.nix
			  /obsidian.nix
			  /kitty.nix
			  /nixvim.nix
			  /zen_andiurne.nix

			  /git.nix
			  /gh.nix

			  /gtk.nix
			  /qt.nix
			  /swappy.nix

			  /keepassxc.nix
			  /swayimg.nix
			] ++
			[
			  inputs.nixvim.homeModules.nixvim
			  ./secrets.nix
			];

			programs = {
			  # HM Manages Itself
			  home-manager.enable = true;
			  git.enable = true;

			  # Misc enables
			  ## For yazi
			  fd.enable = true;
			  fzf.enable = true;
			  ripgrep.enable = true;
			  jq.enable = true;
			};

			gtk.enable = true; # For swappy, noctalia provides theming with adw-gtk3

			# Basic HM config
			home = {
			  username = "andiurne";
			  homeDirectory = "/home/andiurne";
			  sessionVariables = {
				  XDG_CONFIG_HOME = "/home/andiurne/.config";
			  };

			  packages = with pkgs; [
				prismlauncher
			  ];

			  # File symlinks
			  file = {
				"face.png" = {
				  source = ../../assets/faces/andiurne.png;
				  executable = true;
				};
				"Pictures/Wallpapers" = {
				  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.config/dotfiles/nixos/assets/Wallpapers";
				  recursive = true;
				};
				"Games/UnbeatableAppData" = {
				  source = config.lib.file.mkOutOfStoreSymlink
				   "${config.home.homeDirectory}/.local/share/Steam/steamapps/compatdata/2240620/pfx/drive_c/users/steamuser/AppData/LocalLow/D-CELL GAMES/UNBEATABLE";
				  recursive = true;
				};
			  };

				# DO NOT TOUCH
				stateVersion = "26.05"; # NO TOUCHY

			};
		})
	];

	home-manager.sharedModules = [
		inputs.sops-nix.homeManagerModules.sops
	];
}
