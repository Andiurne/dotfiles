{pkgs, inputs, ...}: {
environment.systemPackages = with pkgs; [
    # Basic graphical environment
    foot
    mpv
    nerd-fonts.jetbrains-mono
    yazi
    inputs.snappy-switcher.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Yazi optional deps.
    glib
    _7zip-zstd-rar
    ffmpeg
    poppler
    wl-clipboard
    imagemagick

    # Screen Capture
    gpu-screen-recorder
    hyprpicker # provides freeze and color picking
    swappy # screenshot editing
    adw-gtk3 # theming for swappy
    # hyprshot # useful for window snipping
    slurp # region selector
    grim # turns region into image
];
}
