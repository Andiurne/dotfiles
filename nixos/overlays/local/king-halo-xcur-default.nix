{...}: {
nixpkgs.overlays = [
        (final: prev: {
                king-halo-xcur-default = prev.stdenv.mkDerivation {
                        pname = "king-halo-xcur";
                        version = "1";
                        src = ../../assets/cursors/king-halo-xcur;
                        postInstall = ''
                                mkdir -p $out/share/icons/default
                                cp -r cursors $out/share/icons/default/cursors
                                cp index.theme $out/share/icons/default/index.theme
                        '';
                };
        })
];}
