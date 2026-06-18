# home.nix for andiurne
{pkgs, ...}: {
imports = [
  ../../programs_HM/andiurne_imports.nix

  # Desktop
  ../../desktop/HM_hyprConf.nix
  ../../desktop/HM_noctalia_conf.nix

  # Gaming
  ../../gaming/HM_gamingConf.nix
];

# HM Manages Itself
programs.home-manager.enable = true;

# Basic HM config
home = {
  username = "andiurne";
  homeDirectory = "/home/andiurne";

  sessionVariables = {
    HYPRCURSOR_THEME = "Silence Suzuka";
    HYPRCURSOR_SIZE = 24;
  };

  # Home-manager Pkgs without config
  packages = with pkgs; [
];

# DO NOT TOUCH
  stateVersion = "26.05"; # NO TOUCHY
};
}
