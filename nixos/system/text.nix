{pkgs, ...}:
{
  fonts = {
    fontconfig.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.agave
      nerd-fonts.fira-code
      nerd-fonts.fantasque-sans-mono
      font-awesome
      vista-fonts
    ];
  };
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
