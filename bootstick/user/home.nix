# home.nix for andiurne
{pkgs, ...}: {
imports = [
  ./programs_HM/live_imports.nix

  # Desktop
  ../desktop/HM_hyprConf.nix
  ../desktop/HM_noctalia_conf.nix

];

# HM Manages Itself
programs.home-manager.enable = true;

gtk.enable = true; # For swappy, noctalia provides theming with adw-gtk3

# Basic HM config
home = {
  username = "nixos";
  homeDirectory = "/home/nixos";

  # File symlinks
  file = {
    "face.png" = {
      source = ../assets/faces/andiurne.png;
      executable = true;
    };
    "Pictures/Wallpapers/background.png".source = ../assets/Wallpapers/originals/smallLogo.png;
    ".config/hypr/scratchpad.lua".text = ''
    --
    '';
  };

  # Home-manager Pkgs without config
  packages = with pkgs; [
];

# DO NOT TOUCH
  stateVersion = "26.05"; # NO TOUCHY
};
}
