{inputs, lib, ...}:{wayland.windowManager.hyprland.extraLuaFiles.noctaliaSettings =
let
  inherit (inputs.andiurne.utils.hyprland)
    prefixBindCmd
    ;
  noctalia = (prefixBindCmd "noctalia msg");
in {
  hl.bind = [
    ["SUPER + C" {submap = "noctalia_panels";}]
  ] ++ map noctalia [
    ["CTRL+ALT+Delete" "panel-toggle session"]
    ["SUPER + SUPER_L" "panel-toggle launcher" ["release"]]
    ["ALT + TAB" "window-switcher"]
    ["SUPER+SHIFT + V" "clipboard"]

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
      body = map noctalia [
        ["S" "settings-toggle"]
        ["V" "panel-toggle clipboard"]
        ["W" "panel-toggle wallpaper"]

        ["C" "panel-toggle control-center"]
        ["SUPER+C" "panel-toggle control-center"]
        ["SHIFT+C" "panel-toggle control-center calendar"]
        ["N" "panel-toggle control-center notifications"]
        ["SHIFT+W" "panel-toggle control-center weather"]
        ["SHIFT+V" "panel-toggle control-center audio"]
      ] ++[["escape" {submap = "reset";}]];
    };
  };
};}
