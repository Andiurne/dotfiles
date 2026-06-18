{pkgs,...}:{
environment.systemPackages = with pkgs; [steam steam-run];

programs.steam = {
  enable = true;
  remotePlay.openFirewall = false;
  dedicatedServer.openFirewall = false;
  localNetworkGameTransfers.openFirewall = false;
};
programs.gamemode.enable=true;
}
