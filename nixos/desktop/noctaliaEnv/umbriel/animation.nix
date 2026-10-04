{inputs, ...}:{programs.umbriel.settings = {
    include.files = [
        "$XDG_CONFIG_HOME/dotfiles/nixos/desktop/noctaliaEnv/umbriel/animations/reveal_reverse/effect.toml"
        "${inputs.umbriel.packages.x86_64-linux.default}/share/umbriel/effects/animation/reveal/effect.toml"
        "${inputs.umbriel.packages.x86_64-linux.default}/share/umbriel/effects/animation/squash/effect.toml"
    ];
    animation = {
        enabled = true;
        duration_ms = 250;
        #curve = "snappy";

        windows_in = {
            style = "popin";
            scale = 0.5;
            curve = "easeout";
        };
        windows_out = {
            style = "fade";
            scale = 0.8;
            curve = "easeout";
        };
        windows_move = {
            curve = "spring:1,900";
        };
    };
};}
