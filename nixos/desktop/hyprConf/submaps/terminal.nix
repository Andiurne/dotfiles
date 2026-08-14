{terminal, fileManager, shell, editor, ...}:{wayland.windowManager.hyprland.extraLuaFiles."submaps/terminal" =
{hl.define_submap.terminal = {
  onDispatch = "reset";
  body = [
    ["T" terminal]
    ["SUPER+T" terminal]
    ["Q" "kitten quick-access-terminal"]
    ["E" fileManager]
    ["SHIFT + E" editor]
    ["V" "${shell} -C nvimFindBase"]

    ["escape" {submap = "reset";}]
  ];
  };};
}
