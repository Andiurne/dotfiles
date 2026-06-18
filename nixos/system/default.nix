{pkgs, ...}:
{
    imports = [
      ./boot.nix
      ./i18n.nix
      ./nvidia.nix
      ./networking.nix
      ./packages.nix
      ./programs.nix
      ./yazi.nix
    ];

    fonts.packages = with pkgs; [
	nerd-fonts.jetbrains-mono
    ];

  # Misc. Service Config
  services = {

    # X11 keymap, US INTL
    xserver.xkb = {
      layout = "us";
      variant = "intl";
    };

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
