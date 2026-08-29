{pkgs, ...}:
{home.pointerCursor = {
    enable = true;
    x11.enable = true;
    gtk.enable = true;
    name = "king-halo-xcur";
    size = 32;
    package = pkgs.king-halo-xcur;
};}
