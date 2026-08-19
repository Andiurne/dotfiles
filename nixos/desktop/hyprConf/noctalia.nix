{inputs, lib, ...}:{wayland.windowManager.hyprland.extraLuaFiles.noctaliaSettings =
let
  inherit (inputs.andiurne.utils.hyprland)
    prefixBindCmd
    ;
  noctalia = (prefixBindCmd "noctalia msg");
  panel = (prefixBindCmd "noctalia msg panel-toggle");
in {
  hl.bind = [
    ["SUPER + V" "noctalia msg panel-toggle clipboard"]
    ["SUPER + C" {submap = "noctalia_panels";}]
  ] ++ map noctalia [
    ["CTRL+ALT+Delete" "panel-toggle session"]
    ["SUPER + SUPER_L" "panel-toggle launcher" ["release"]]
    ["ALT + TAB" "window-switcher"]
    ["SUPER+SHIFT + V" "clipboard"]
    ["SUPER + comma" "settings-toggle"]

    # Session Control
    ["SUPER + L" "session lock"]
    ["SUPER+SHIFT + L" "session lock-and-suspend"]

    # Media Control
    ["SUPER + CONTROL+SPACE" "media toggle"]
    ["XF86AudioRaiseVolume" "volume-up 2" ["locked" "repeating"]]
    ["XF86AudioLowerVolume" "volume-down 2" ["locked" "repeating"]]
    ["XF86MonBrightnessUp" "brightness-up"]
    ["XF86MonBrightnessDown" "brightness-down"]
  ];

  hl.define_submap = {
    wallpaper.body = map noctalia [
      ["W" "panel-toggle wallpaper"]
      ["SHIFT+W" "panel-toggle noctalia:wallhaven/browser"]
      ["comma" "wallpaper-previous"]
      ["period" "wallpaper-next"]
      ["slash" "wallpaper-random"]
    ] ++ [["escape" {submap = "reset";}]];

    noctalia_panels = {
      onDispatch = "reset";
      body = map panel [
        ["V" "clipboard"]
        ["W" "wallpaper"]

        ["C" "control-center"]
        ["SUPER+C" "control-center"]
        ["SHIFT+C" "control-center calendar"]
        ["B" "control-center bluetooth"]
        ["N" "control-center notifications"]
        ["SHIFT+N" "control-center network"]
        ["SHIFT+W" "control-center weather"]
        ["SHIFT+V" "control-center audio"]
      ] ++[["escape" {submap = "reset";}]];
    };
  };
};}
