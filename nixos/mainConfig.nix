{
  config,
  lib,
  pkgs,
  inputs, # This is what holds home-manager, etc. I think.
  ...
  }:
{
  # This is where modularity should happen! Not with import ./*** later!
  # I think. Maybe.
  imports = [
      # Base DE
      ./desktop

      # System Stuff
      ./system

      # Users to include
      ./users/devinr.nix

  ];

  # Nix Settings
  nix.settings = {
    allowed-users = ["devinr"];
    experimental-features = ["nix-command" "flakes"];
  };
  nixpkgs.config.allowUnfree = true;

  # Set shell
  users.extraUsers.devinr = {
    shell = pkgs.fish;
  };

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
