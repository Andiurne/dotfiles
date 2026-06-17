# home.nix for devinr
# This is where home-managed programs.* and services.* go as options
{pkgs, inputs, ...}: {
imports = [
  ../programs_HM/devinr_imports.nix
  #./homeServices

  # Desktop
  ../desktop/devinr-HM_hyprConf.nix
  ../desktop/devinr-HM_noctalia_conf.nix
];

# HM Manages Itself
programs.home-manager.enable = true;

# Basic HM config
home = {
  username = "devinr";
  homeDirectory = "/home/devinr";

  # Home-manager Pkgs without config
  packages = with pkgs; [
];

# DO NOT TOUCH
  stateVersion = "26.05"; # NO TOUCHY
};
}
