{pkgs, ...}:
{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ];

  console.useXkbConfig = true;
  services = {
    xserver.xkb = {
      layout = "us";
      variant = "altgr-intl";
    };
  };
}
