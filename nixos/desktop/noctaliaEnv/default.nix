let
    umbriel = builtins.getFlake "git+https://github.com/noctalia-dev/umbriel/4473db4773225e5fb5c7f792afd5a756e4cb9016";
in {
    imports = [
        umbriel.nixosModules.default
    ];

    programs.umbriel.enable = true;

    home-manager.users.andiurne.imports = [
        umbriel.homeModules.default
        "umbriel.nix"
    ];

}
