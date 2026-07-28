{inputs, ...}:{
imports = map (x: ./modules + x ) [
  # Shadows
  /yazi.nix
  /fish.nix

  # Locals
  /equibop.nix
  /obsidian.nix
  /kitty.nix
  /nixvim.nix

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
];

programs = {
  home-manager.enable = true;
  git.enable = true;

  # Misc enables
  ## For yazi
  fd.enable = true;
  fzf.enable = true;
  ripgrep.enable = true;
  jq.enable = true;
  };
}
