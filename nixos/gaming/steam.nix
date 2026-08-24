{pkgs, config, inputs, lib, ...}:{
imports = [ inputs.steam-presence.nixosModules.steam-presence ];

nixpkgs.overlays = [
  inputs.millennium.overlays.default
];
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
  extraPackages = with pkgs; [ king-halo-xcur-default ];
  remotePlay.openFirewall = false;
  dedicatedServer.openFirewall = false;
  localNetworkGameTransfers.openFirewall = false;

  presence = {
    enable = true;
    steamApiKeyFile = builtins.toPath config.sops.secrets.STEAM_API_KEY.path;
    userIds = [ (lib.strings.trim (builtins.readFile ../secrets/STEAM_USER_ID)) ];
    coverArt = {
      steamGridDB = {
        enable = true;
        apiKeyFile = builtins.toPath config.sops.secrets.STEAM_GRID_DB_API_KEY.path;
      };
    };
    localGames = {
      enable = false;
    };
  };
};
programs.gamemode.enable=true;
}
