detach: esc: {wayland.windowManager.hyprland.extraLuaFiles."submaps/programs" = {
hl.define_submap.programs = {
      onDispatch = "reset";
      body = [
        ["E" (detach "obsidian")]
        ["S" "steam"]
        ["C" "hyprpicker -a"]
        ["V" "pwvucontrol"]
        esc
      ];
    };
};}
