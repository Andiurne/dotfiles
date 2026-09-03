{pkgs, ...}:{

programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = true;
};

home-manager.users.andiurne.imports = [
    ({config, pkgs, ...}:{
        services.pass-secret-service = {
            enable = true;
            storePath = "${config.home.homeDirectory}/.config/dotfiles/passStore";
        };

        home.packages = with pkgs; [
            pass-wayland
            gnupg
            ];
    })
];

}
