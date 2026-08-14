browser: {inputs, ...}:{wayland.windowManager.hyprland.extraLuaFiles."submaps/browser" =
let
  inherit (inputs.andiurne.utils.hyprland)
    prefixBindCmd
    ;
in {
hl.define_submap.browser = {
  onDispatch = "reset";
  body = map (prefixBindCmd browser) [
    ["W" ""]
    ["Y" "youtube.com"]
  ] ++ [["escape" {submap = "reset";}]];
};
};}
