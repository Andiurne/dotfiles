{pkgs, ...}:
{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      font-awesome
    ];
  };
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
