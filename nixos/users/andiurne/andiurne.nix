{pkgs, ...}:{
  imports = [
    ../gaming/gamingConf.nix
  ];

users.users.andiurne = {
  isNormalUser = true;
  description = "Andiurne";
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
