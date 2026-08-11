{inputs, lib, ...}:{wayland.windowManager.hyprland.extraLuaFiles."binds".hl =
let
  inherit (inputs.andiurne.utils.hyprland)
    prefixBindCmd
    mkEmptyDspBind
    ;

  terminal = "kitty";
  shell = "fish";
  fileManager = "${terminal} -- ${shell} -C y";
  browser = "zen-twilight";
  editor = "${terminal} -- ${shell} -C nvimFindBase";
  detach = cmd: "app2unit -- ${cmd}";

in {
  bind = [
    ["SUPER + N" {submap = "noctalia";}]
    ["SUPER + M" {submap = "nvim_mvFocus";}]
    ["SUPER + P" {submap = "programs";}]
    ["SUPER + W" {submap = "windows_workspaces";}]

    ["XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"]
    ["SUPER+backspace" {dpms = "display off";}]

    # Screen Cap Globals
    ["SUPER + R" "${shell} -c screenrec-toggle"]
    ["SUPER + S" "${shell} -c screencap-region"]
    ["SUPER+SHIFT + S" "${shell} -c screencap-window"]
    ["Print" "${shell} -c screencap-screen"]


    ["SUPER + mouse_down" {focus.workspace = "r-1";} ]
    ["SUPER + mouse_up" {focus.workspace = "r+1";} ]

  ] ++ map (prefixBindCmd "noctalia msg") [

    ["SUPER + SUPER_L" "panel-toggle launcher" ["release"]]
    ["SUPER+SHIFT + TAB" "panel-toggle launcher /win"]
    ["ALT + TAB" "window-switcher"]
    # Media Control
    ["SUPER + CONTROL + SPACE" "media toggle"]
    ["XF86AudioRaiseVolume" "volume-up 2" ["locked" "repeating"]]
    ["XF86AudioLowerVolume" "volume-down 2" ["locked" "repeating"]]
    ["XF86MonBrightnessUp" "brightness-up"]
    ["XF86MonBrightnessDown" "brightness-down"]

  ] ++ map mkEmptyDspBind [

    ["SUPER + F" "window.fullscreen"]
    ["SUPER + Q" "window.close"]
    ["SUPER + mouse:272" "window.drag" ["mouse"]]
    ["SUPER + mouse:273" "window.resize" ["mouse"]]

  ];

  define_submap = {
    windows_workspaces.body = [
      ["escape" {submap = "reset";}]

      ["h" {focus.direction = "l";} ]
      ["j" {focus.direction = "d";} ]
      ["k" {focus.direction = "u";} ]
      ["l" {focus.direction = "r";} ]
      ["SUPER + J" { layout = "togglesplit";} ]

      ] ++ (builtins.foldl'
        (list: num:
          list ++
            [
              ["SUPER + ${num}" {focus.workspace = num;} ]
              ["SUPER+SHIFT + ${num}" {"window.move".workspace = num;} ]
        ])
        []
        (map builtins.toString (lib.lists.range 0 9))
      );

    noctalia = {
      onDispatch = "reset";
      body = map (prefixBindCmd "noctalia msg") [
        ["SUPER + comma" "settings-toggle"]
        ["SUPER + V" "panel-toggle clipboard"]
        ["SUPER + X" "panel-toggle control-center"]
        ["SUPER+SHIFT + W" "panel-toggle wallpaper"]

        # Session Control
        ["SUPER + L" "session lock"]
        ["SUPER+SHIFT + L" "session lock-and-suspend"]
        ["CTRL+ALT+Delete" "panel-toggle session"]

      ];
    };

    programs = {
      onDispatch = "reset";
      body = [
        ["SUPER+T" terminal]
        ["SUPER+SHIFT + T" "kitten quick-access-terminal"]
        ["SUPER + E" fileManager]
        ["SUPER+SHIFT + E" editor]
        ["SUPER + W" browser]
        ["SUPER + O" (detach "obsidian")]
        ["SUPER+SHIFT + P" "hyprpicker -a"]

        # Specials
        ["SUPER + C" {focus.workspace = "empty";} ]
        ["SUPER+SHIFT + C" {"window.move".workspace = "empty";} ]
        ["SUPER + D" { "workspace.toggle_special" = "discord"; }]
        ["SUPER+SHIFT + D" { "window.move".workspace = "special:discord"; }]
        ["SUPER + M" { "workspace.toggle_special" = "music"; }]
        ["SUPER+SHIFT + M" { "window.move".workspace = "special:music"; }]
      ];
    };

    nvim_mvFocus.body = [
            ["escape" {submap = "reset";} ]
    ];
  };
};}
