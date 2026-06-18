{pkgs, ...}:{
  imports = [
    ../../gaming/gamingConf.nix
    ./module.nix
  ];

users.extraUsers.andiurne.shell = pkgs.fish;

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
