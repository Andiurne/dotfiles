{...}:{
    imports = [
      ./boot.nix
      ./audio.nix
      ./i18n.nix
      ./networking.nix
      ./packages.nix
      ./programs.nix
      ./yazi.nix
      ./text.nix
      ./virtualisation.nix
    ];


    services = {
    # CUPS Printing
    printing.enable = true;


    # gvfs for yazi usb handling
    gvfs.enable = true;
  };
}
