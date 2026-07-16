{pkgs, ...}:
{
    imports = [
      ./boot.nix
      ./i18n.nix
      ./networking.nix
      ./packages.nix
      ./programs.nix
      ./yazi.nix
      ./text.nix
    ];


    services = {
    # CUPS Printing
    printing.enable = true;

    # Sound w/ pipewire
    # Pulse is probably on by default for compat
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
          enable = true;
          support32Bit = true;
        };
      pulse.enable = true;
    };

    # gvfs for yazi usb handling
    gvfs.enable = true;
  };
}
