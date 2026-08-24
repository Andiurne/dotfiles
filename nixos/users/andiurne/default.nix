{pkgs, ...}:{
  imports = [
    ../../gaming/andiurne_gamingConf.nix
    ./module.nix
    ../../desktop/niri.nix
  ];

users.extraUsers.andiurne.shell = pkgs.fish;
users.users.andiurne = {
  isNormalUser = true;
  description = "Andiurne";
  extraGroups = [ "networkmanager" "wheel" "users" "wireshark" "keys"];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    app2unit
    pear-desktop # YT Music
    fractal
    gimp
    ani-cli
    ntfs3g
  ];

  };
}
