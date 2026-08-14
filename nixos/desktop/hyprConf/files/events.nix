{inputs, lib, ...}:let
  inherit (inputs.andiurne.utils.hyprland)
    genAutostart
    moduleLib
    nixLuaUtils
    ;

  inherit (moduleLib)
    mkDispatchCall
    ;

  inherit (nixLuaUtils)
    mkLuaCallWithTable
    ;

  inherit lib;
in {hl.on = {
  "hyprland.start" = genAutostart
    [
      "noctalia"
      "equibop"
      "steam -silent"
    ];
  "window.open" = {
    parameters = ["w"];
    body = lib.concatStringsSep "\n"
      [
        (mkDispatchCall
          (mkLuaCallWithTable {path = ["hl" "dsp" "window" "move"];}
            {
              workspace = "special:discord";
              follow = false;
              window = "class:equibop";
            }
          ))
        (mkDispatchCall
          (mkLuaCallWithTable {path = ["hl" "dsp" "window" "move"];}
            {
              workspace = "special:music";
              follow = true;
              window = "class:com.github.th_ch.youtube_music";
            })
          )
      ];
  };
};}
