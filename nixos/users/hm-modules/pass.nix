{config, pkgs, ...}:{
services.pass-secret-service = {
    enable = true;
    storePath = "${config.home.homeDirectory}/.config/dotfiles/passStore";
};

home.packages = with pkgs; [
    pass-wayland
    gnupg
    ];
}
