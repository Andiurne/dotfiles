{inputs, ...}:{
imports = map (x: ./modules + x ) [
  # Shadows
  /yazi.nix
  /fish.nix

  # Locals
  /equibop.nix
  /zen-andiurne.nix
  /obsidian.nix
  /foot.nix
  /git.nix

  /gtk.nix
  /qt.nix
  /swappy.nix

  /keepassxc.nix
] ++
[
  inputs.nixvim.homeModules.nixvim
];
}
