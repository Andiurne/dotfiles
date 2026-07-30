{
        description = "swayimg & home-manager module with lua config";

        inputs = {
                nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
                home-manager.url = "github:nix-community/home-manager";
                home-manager.inputs.nixpkgs.follows = "nixpkgs";
        };


        outputs = {self, nixpkgs, home-manager, ...}:
        let
                allSystems = [
                        "x86_64-linux" # 64-bit Intel/AMD Linux
                        "aarch64-linux" # 64-bit ARM Linux
                        "x86_64-darwin" # 64-bit Intel macOS
                        "aarch64-darwin" # 64-bit ARM macOS
                ];
                forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
                        pkgs = import nixpkgs {inherit system; };
                        });
        in
        {
                packages = forAllSystems ({pkgs}: {
                        default = pkgs.swayimg.overrideAttrs {
                                src = pkgs.fetchFromGithub {
                                        owner = "artemsen";
                                        repo = "swayimg";
                                        rev = "v5.5";
                                        hash = "...";
                                };
                                version = "v5.5";
                        };
                });

                homeModules = {
                        latest = self.homeModules."v5_5";
                        v5_5 = import ./hm-module.nix {};
                };
        };
}
