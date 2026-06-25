{pkgs, ...}:{
  imports = [
    ./module.nix
  ];

users.extraUsers.live.shell = pkgs.fish;

users.users.live = {
  isNormalUser = true;
  description = "Live User";
  extraGroups = [ "networkmanager" "wheel" ];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    gh
    app2unit
    pear-desktop # YT Music
  ];

  };
}
