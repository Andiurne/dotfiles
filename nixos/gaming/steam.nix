{pkgs, inputs, ...}:{
nixpkgs.overlays = [ inputs.millennium.overlays.default ];
environment.systemPackages = with pkgs; [steam-run protonplus];

# Supposed to fix Steam being fucky
hardware.graphics = {
  #enable = true; Should already be enabled by most modules
  enable32Bit = true;
  extraPackages = [ pkgs.vkd3d ];
};

programs.steam = {
  enable = true;
  package = pkgs.millennium-steam;
  remotePlay.openFirewall = false;
  dedicatedServer.openFirewall = false;
  localNetworkGameTransfers.openFirewall = false;
};
programs.gamemode.enable=true;
}
