{pkgs, ...}:
{home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "king-halo-xcur";
    size = 32;
    package = pkgs.king-halo-xcur;
};}
