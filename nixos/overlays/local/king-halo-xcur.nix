{...}: {
nixpkgs.overlays = [
        (final: prev: {
                king-halo-xcur = prev.stdenv.mkDerivation {
                        pname = "king-halo-xcur";
                        version = "1";
                        src = ../../../assets/cursors/KH_X;
                        postInstall = ''
                                mkdir -p $out/share/icons/king-halo-xcur
                                cp -r cursors $out/share/icons/king-halo-xcur/cursors
                                cp index.theme $out/share/icons/king-halo-xcur/index.theme
                        '';
                };
        })
];}
