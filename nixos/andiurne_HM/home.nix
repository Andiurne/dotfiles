# home.nix for ANDIURNE :p
# This is where home-managed programs.* and services.* go as options
{pkgs, ...}: {
imports = [
  ../programs_HM/andiurne_imports.nix
  #./homeServices

  # Desktop
  ../desktop/devinr-HM_hyprConf.nix
  ../desktop/devinr-HM_noctalia_conf.nix

  # Gaming
  ../gaming/andiurne-HM_gamingConf.nix
];

# HM Manages Itself
programs.home-manager.enable = true;

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
