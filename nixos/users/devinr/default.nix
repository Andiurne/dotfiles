{pkgs, ...}:{
  imports = [
    ./module.nix
  ];

users.extraUsers.devinr.shell = pkgs.fish;

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

    # Screenshot Utils
    slurp
    grim
    adw-gtk3 # for noctalia GTK theming on swappy
  ];

  };
}
