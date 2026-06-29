{
  config,
  lib,
  pkgs,
  inputs, # This is what holds home-manager, etc. I think.
  ...
  }:
{
  # Nix Settings
  nix.settings = {
    # Don't compile hyprland yourself, idjit...
    substituters = ["https://hyprland.cachix.org"];
    trusted-substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    trusted-users = ["root" "@wheel"];

    experimental-features = ["nix-command" "flakes"];
  };
  nixpkgs.config.allowUnfree = true;

  imports = [
      # Base DE
      ./desktop

      # System Stuff
      ./system
  ];


  # Set console keymap (for tty)
  console.keyMap = "us";

  # Date & Time
  time.timeZone = "America/Los_Angeles";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?
}
