{config, pkgs, inputs, lib, ...}: {
imports =  [ ./shared_imports.nix ];
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
