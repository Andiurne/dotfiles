{pkgs, config, ...}: {
home.packages = with pkgs; [
  prismlauncher
];
  home.file."Games/UnbeatableAppData" = {
    source = config.lib.file.mkOutOfStoreSymlink
     "${config.home.homeDirectory}/.local/share/Steam/steamapps/compatdata/2240620/pfx/drive_c/users/steamuser/AppData/LocalLow/D-CELL GAMES/UNBEATABLE";
    recursive = true;
  };

}
