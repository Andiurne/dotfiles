{pkgs, ...}:{
  imports = [
    ./module.nix
  ];

users.extraUsers.devinr.shell = pkgs.fish;

users.users.devinr = {
  isNormalUser = true;
  description = "Devin Riehle";
  extraGroups = [ "networkmanager" "wheel" "users" ];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    gh
    github-desktop
    app2unit
    pear-desktop # YT Music
  ];

  };
}
