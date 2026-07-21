{pkgs, ...}:{
  imports = [
    ./module.nix
  ];

users.extraUsers.nixos.shell = pkgs.fish;
programs.wireshark = {
    enable = true;
    usbmon.enable = true;
    dumpcap.enable = true;
  };
users.users.nixos = {
  isNormalUser = true;
  description = "live";
  extraGroups = [ "networkmanager" "wheel" "users" "wireshark" ];

  # Local pkgs that AREN'T HM-compatible
  packages = with pkgs; [
    app2unit
    pear-desktop # YT Music
    wireshark
    ntfs3g
  ];



  };
}
