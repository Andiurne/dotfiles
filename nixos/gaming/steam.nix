{pkgs, config, inputs, lib, ...}:{
imports = [
  inputs.steam-presence.nixosModules.steam-presence
  ./lutris.nix
  ];

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

  protontricks = {
    enable = true;
    /*package = pkgs.protontricks.overrideAttrs (old: {
      version = "1.14.0";
      src = pkgs.fetchFromGitHub {
        owner = "Matoking";
        repo = "protontricks";
        tag = "1.14.0";
        hash = "sha256-pTBpzSBGFUmol3Osb78yhyZup2DogLpNaBg/kF0dVGI=";
      };
      });*/
  };

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
