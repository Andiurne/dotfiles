{pkgs, lib, inputs, ...}:
let
    system = pkgs.stdenv.hostPlatform.system;
in {
environment.systemPackages = with pkgs; [
    # Basic graphical environment
    foot
    inputs.andiurne.packages.${system}.lintree
    mpv
    nerd-fonts.jetbrains-mono
    btop
    git
    pwvucontrol
    yazi


    # Yazi optional deps.
    glib
    _7zip-zstd-rar
    ffmpeg
    poppler
    wl-clipboard
    imagemagick

    # File Openers
    swayimg # Wayland image viewer that overlays a terminal (in hyprland)
    zathura # Minimal pdf viewer

    # Screen Capture
    gpu-screen-recorder
    swappy # screenshot editing
    adw-gtk3 # theming for swappy
    papirus-icon-theme # for GTK/swappy
    slurp # region selector
    grim # turns region into image
];
}
