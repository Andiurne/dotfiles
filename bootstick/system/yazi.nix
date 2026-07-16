{config, pkgs, ...}: {
# Yazi optional dep
programs.zoxide.enable = true;

programs.yazi = {
    enable = true;
};
}
