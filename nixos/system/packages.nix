{pkgs, inputs, ...}:
let
    system = pkgs.stdenv.hostPlatform.system;
in {
environment.systemPackages = with pkgs; [
    # Secrets Management
    inputs.agenix.packages.${system}.default
    keepassxc # Remember to enable FdoSecrets!!!
    git-credential-keepassxc

    # Basic graphical environment
    foot
    inputs.lintree.packages.${system}.default
    mpv
    nerd-fonts.jetbrains-mono
    yazi
    inputs.snappy-switcher.packages.${system}.default
    btop
    git
    comma

    # Yazi optional deps.
    glib
    _7zip-zstd-rar
    ffmpeg
    poppler
    wl-clipboard
    imagemagick

    swayimg # Wayland image viewer that overlays a terminal

    # Screen Capture
    gpu-screen-recorder
   swappy # screenshot editing
    adw-gtk3 # theming for swappy
    papirus-icon-theme # for GTK/swappy
    # hyprshot # useful for window snipping
    slurp # region selector
    grim # turns region into image
];
}
