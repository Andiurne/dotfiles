{pkgs, ...}:{
  imports = [
    ../../gaming/steam.nix
    ./module.nix
  ];

users.extraUsers.devinr.shell = pkgs.fish;

users.users.devinr = {
  isNormalUser = true;
  description = "Devin Riehle";
  extraGroups = [ "networkmanager" "wheel" "users" "libvrtd" "keys"];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    app2unit
    pear-desktop # YT Music
    ani-cli
  ];

  };
}
