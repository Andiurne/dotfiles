{inputs, lib, ...}:{wayland.windowManager.hyprland.hl.on = let
  inherit (inputs.andiurne-modules.utils.hyprland)
    genAutostart
    moduleLib
    nixLuaUtils
    ;

  inherit (moduleLib)
    mkDispatchCall
    ;

  inherit (nixLuaUtils)
    mkLuaFunctionText
    mkLuaCallWithTable
    ;

  inherit lib;
in {
  "hyprland.start" = genAutostart
    [
      "noctalia"
      "equibop"
      "steam -silent"
    ];
  "window.open" = mkLuaFunctionText {
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
