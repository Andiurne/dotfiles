esc: {lib, ...}:{wayland.windowManager.hyprland.extraLuaFiles."submaps/movefocus" = {
hl.define_submap.movefocus = {
      body = [
        ["H" {focus.direction = "l";}]
        ["J" {focus.direction = "d";}]
        ["K" {focus.direction = "u";}]
        ["L" {focus.direction = "r";}]

        ["Left" {focus.direction = "l";}]
        ["Down" {focus.direction = "d";}]
        ["Up" {focus.direction = "u";}]
        ["Right" {focus.direction = "r";}]

        ["period" {focus.workspace = "m+1";}]
        ["comma" {focus.workspace = "m-1";}]
        esc
      ] ++ (
        map
          (num: [num {focus.workspace = num;}])
          (map builtins.toString (lib.lists.range 0 9))
      );
    };
};}
