{pkgs, lib, ...}: {
  imports = [
    ./common
    ./lang
    ./lsp
    ./lualine
    ./snacks

    ./blink-cmp.nix
    ./firenvim.nix
    ./git.nix
    ./noice.nix
    ./treesitter.nix
  ];
  }
