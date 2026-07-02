{config, pkgs, inputs, lib, ...}: {
imports = map (x: ./modules + x ) [
  # Shadows
  /yazi.nix
  /fish.nix

  # Locals
  /equibop.nix
  /zen-andiurne.nix
  /obsidian.nix
  /foot.nix

  /gtk.nix
  /qt.nix

  /keepassxc.nix
] ++
[
  inputs.nixvim.homeModules.nixvim
];
programs = {
  home-manager.enable = true;
  git.enable = true;

  nixvim = {
  	enable = true;
	defaultEditor = true;
	vimdiffAlias = true;
  	imports = [ ./modules/nixvim.nix ];
  };

  # Misc enables
  ## For yazi
  fd.enable = true;
  fzf.enable = true;
  ripgrep.enable = true;
  jq.enable = true;
  };
}
