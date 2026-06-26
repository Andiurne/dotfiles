# home.nix for devinr
# This is where home-managed programs.* and services.* go as options
{pkgs, inputs, ...}: {
imports = [
  ../../programs_HM/devinr_imports.nix

  # Desktop
  ../../desktop/HM_hyprConf.nix
  ../../desktop/HM_noctalia_conf.nix
  ../../desktop/HM_pointerCursor.nix

];

# HM Manages Itself
programs.home-manager.enable = true;

gtk.enable = true; # For swappy, noctalia provides theming with adw-gtk3

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
