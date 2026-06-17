{config, pkgs, inputs, lib, ...}: {
imports = [
  # Shadows
  ./yazi.nix
  ./fish.nix

  # Locals
  ./equibop.nix
  ./zen-browser.nix
  ./obsidian.nix
  ./foot.nix

  # Nixvim bs
  inputs.nixvim.homeModules.nixvim
];
programs = {
  home-manager.enable = true;
  kitty.enable = true;
  git.enable = true;

  nixvim = {
  	enable = true;
	defaultEditor = true;
	vimdiffAlias = true;
  	imports = [ ./nixvim.nix ];
  };

  # Misc enables
  ## For yazi
  fd.enable = true;
  fzf.enable = true;
  ripgrep.enable = true;
  jq.enable = true;
  };
}
