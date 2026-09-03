{pkgs, ...}:{
  imports = [
    ./home-manager.nix
    ../../desktop

    # Gaming
    ../../gaming/steam.nix
    (import ../../gaming/ryubing "andiurne")
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

    pandoc
    texliveFull
  ];

  };
}
