{pkgs, config, ...}: {
home.packages = with pkgs; [
  prismlauncher
];
  home.file."Games/UnbeatableAppData" = {
    source = config.lib.file.mkOutOfStoreSymlink
      (builtins.toPath "${config.home.homeDirectory}/Steam/steamapps/compatdata/2240620/pfx/drive_c/users/steamuser/AppData/LocalLow/D-CELL Games/UNBEATABLE");
    recursive = true;
  };

}
