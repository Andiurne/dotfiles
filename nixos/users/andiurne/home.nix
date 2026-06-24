# home.nix for andiurne
{pkgs, ...}: {
imports = [
  ../../programs_HM/andiurne_imports.nix

  # Desktop
  ../../desktop/HM_hyprConf.nix
  ../../desktop/HM_noctalia_conf.nix

  # Gaming
  ../../gaming/andiurne-HM_gamingConf.nix
];

# HM Manages Itself
programs.home-manager.enable = true;

gtk.enable = true; # For swappy, noctalia provides theming with adw-gtk3

# Basic HM config
home = {
  username = "andiurne";
  homeDirectory = "/home/andiurne";

  # Home-manager Pkgs without config
  packages = with pkgs; [
];

# DO NOT TOUCH
  stateVersion = "26.05"; # NO TOUCHY
};
}
