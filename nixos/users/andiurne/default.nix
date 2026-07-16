{pkgs, ...}:{
  imports = [
    ../../gaming/andiurne_gamingConf.nix
    ./virt-manager.nix
    ./module.nix
  ];

users.extraUsers.andiurne.shell = pkgs.fish;
programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    dumpcap.enable = true;
  };
users.users.andiurne = {
  isNormalUser = true;
  description = "Andiurne";
  extraGroups = [ "networkmanager" "wheel" "users" "wireshark" ];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    app2unit
    pear-desktop # YT Music
    fractal
    gimp
    ani-cli
    wireshark
  ];



  };
}
