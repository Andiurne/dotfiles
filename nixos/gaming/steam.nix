{pkgs, inputs, ...}:{
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
    # Hardcoded for now because this has taken too long to solve
    # Should be solved in future by figuring out system-wide sops
    steamApiKeyFile = "/home/andiurne/.config/sops-nix/secrets/STEAM_API_KEY";
    userIds = [ "76561198303411470" ];
  };
};
programs.gamemode.enable=true;
}
