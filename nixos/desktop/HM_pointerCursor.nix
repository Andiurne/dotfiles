{pkgs, ...}:
let
name = "King Halo";
size = 32;
in {
home = {
        /*pointerCursor = {
                gtk.enable = true;
                x11.enable = true;
                size = size;
                name = name;
                package = pkgs.king-halo-xcur;
        };*/

        file.".icons/default".source = "${pkgs.king-halo-xcur}/share/icons/king-halo-xcur";
};

}
