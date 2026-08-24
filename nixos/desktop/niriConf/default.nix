let
    kdl = (builtins.getFlake "github:Lhcfl/nix-kdl/0057a33bb545e4a1e9ef06f56df99e359ebd2b00").outputs.kdl;
in {
    imports = map (path: import path kdl ) [
        ./config.nix

        ./binds.nix
        ./devices.nix
        ./layout.nix
        ./workspaces.nix
        ./style.nix
    ];
}
