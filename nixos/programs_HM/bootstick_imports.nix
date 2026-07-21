{inputs, ...}:{
imports = map (x: ./modules + x ) [
  # Shadows
  /yazi.nix
  /fish.nix
  /foot.nix
  /git.nix
  /gtk.nix
  /qt.nix
  /swappy.nix
  /keepassxc.nix
  /zen_live.nix
  /btop.nix
  /nixvim.nix
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
  };

  # Misc enables
  ## For yazi
  fd.enable = true;
  fzf.enable = true;
  ripgrep.enable = true;
  jq.enable = true;
  };
}
