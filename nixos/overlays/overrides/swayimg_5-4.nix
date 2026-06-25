{...}: {
nixpkgs.overlays = [
          (final: prev: {
                  swayimg = prev.swayimg.overrideAttrs (old: {
                                version = "5.4";
                                src = prev.fetchFromGitHub {
                                        owner = old.src.owner;
                                        repo = old.src.repo;
                                        tag = "v5.4";
                                        hash = "sha256-PB+EufDpz5Rc6hKO/ish7HdGaEZtxmrtYqnmR+ZpFDY=";
                                };

                                buildInputs = old.buildInputs ++ [
                                        prev.openjpeg
                                ];
                         }
                        );
                  })
];
}
