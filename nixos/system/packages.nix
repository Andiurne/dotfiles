{pkgs, inputs, ...}: {
environment.systemPackages = with pkgs; [
    # Basic graphical environment
    foot
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
];
}
