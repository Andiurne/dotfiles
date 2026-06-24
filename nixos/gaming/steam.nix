{pkgs,...}:{
environment.systemPackages = with pkgs; [steam steam-run];

# Supposed to fix Steam being fucky
hardware.graphics.enable32Bit = true;

programs.steam = {
  enable = true;
  remotePlay.openFirewall = false;
  dedicatedServer.openFirewall = false;
  localNetworkGameTransfers.openFirewall = false;
};
programs.gamemode.enable=true;
}
