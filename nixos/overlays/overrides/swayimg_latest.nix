{...}: {
nixpkgs.overlays = [
          (final: prev: {
                  swayimg = prev.swayimg.overrideAttrs (old: {
                                version = "latest";
                                src = prev.fetchFromGitHub {
                                        owner = old.src.owner;
                                        repo = old.src.repo;
                                        rev = "409d521"; # This is the commit which fixed my issue
                                        hash = "sha256-9p4LULSczN2toypWJFR1VNcDG5ce/tZ3vh97kXZoE7c=";
                                };

                                buildInputs = old.buildInputs ++ [
                                        prev.openjpeg
                                ];
                         }
                        );
                  })
];
}
