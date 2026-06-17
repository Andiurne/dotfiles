{config, pkgs, ...}:{
  imports = [
    ../desktop/noctaliaReqs.nix
  ];

users.users.devinr = {
  isNormalUser = true;
  description = "Devin Riehle";
  extraGroups = [ "networkmanager" "wheel" ];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    gh
    github-desktop
    app2unit
    pear-desktop # YT Music
  ];

  };
}
