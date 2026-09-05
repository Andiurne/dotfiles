{inputs, pkgs, ...}:{
    imports = [
        ./requirements.nix
    ];
    home-manager.users.andiurne.imports = [
        inputs.noctalia.homeModules.default
        (
            {config, ...}:
            let
                foldImports = ini: nameList:
                    builtins.foldl'
                        (prev: new: prev // new)
                        ini
                        (map
                            (name: (import ./${name}.nix))
                            nameList
                        )
                    ;
            in {
            home.file.".config/noctalia/user-templates.toml".text = (import ./user-templates.nix "/home/andiurne/.config/dotfiles/nixos/desktop/noctaliaEnv/shell/templates");

            home.packages = with pkgs; [
                # Needed for plugins
                python3
            ];

            programs.noctalia =  {
                enable = true;

                # Settings go here.
                # See https://docs.noctalia.dev/v4/getting-started/nixos/?section=config-with-home-manager#config-with-home-manager
                # Note: to diff this and latest gui-modified, do
                # nix shell nixpkgs#json-diff -c bash -c "json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)"
                # (this might be worth defining in script
                settings = foldImports {
                    shell.avatarImage = config.home.homeDirectory + "/face.png";
                    #bar.order = [ "leftMain" ];
                    weather.unit = "imperial";
                    wallpaper = {
                        directory = "~/Pictures/Wallpapers/curated";
                        per_monitor_directories = true;
                    };
                    nightlight.enabled = true;
                    notification.scale = 0.75;
                    location.auto_locate = true;
                    brightness = {
                        enable_ddcutil = true;
                        monitor = {
                            "DP-3".backend = "ddcutil";
                            "eDP-1" = {
                                backend = "backlight";
                            };
                        };
                    };
                } [
                    "controlCenter"
                    "idle"
                    "topBar"
                    "lockscreen"
                    "plugins"
                    "shell"
                    "theme"
                    "widget"
                ];
            };
            }
        )
    ];
}
