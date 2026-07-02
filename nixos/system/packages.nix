{pkgs, inputs, ...}: {
environment.systemPackages = with pkgs; [
    # Secrets Management
    inputs.agenix.packages.${pkgs.stdenv.hostPlatform.system}.default
    keepassxc # Remember to enable FdoSecrets!!!
    git-credential-keepassxc

    # Basic graphical environment
    foot
    mpv
    nerd-fonts.jetbrains-mono
    yazi
    inputs.snappy-switcher.packages.${pkgs.stdenv.hostPlatform.system}.default
    git
    btop

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
    hyprpicker # provides freeze and color picking
    hyprshot # for window and freezing
    swappy # screenshot editing
    adw-gtk3 # theming for swappy
    papirus-icon-theme # for GTK/swappy
    # hyprshot # useful for window snipping
    slurp # region selector
    grim # turns region into image
];
}
