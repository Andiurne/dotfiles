{inputs, lib, ...}:{wayland.windowManager.hyprland.extraLuaFiles."byCall/bind".hl.bind =
let
  inherit (inputs.andiurne-modules.utils.hyprland)
    prefixBindCmd
    mkDspBind
    mkEmptyDspBind
    ;
  terminal = "kitty";
  shell = "fish";
  fileManager = "${terminal} -- ${shell} -C y";
  browser = "zen-twilight";
  editor = "${terminal} -- ${shell} -C nvimFindBase";
  detach = cmd: "app2unit -- ${cmd}";
in [
  ["XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"]
  ["SUPER+backspace" {dpms = "display off";}]

  # Programs
  ["SUPER+T" terminal]
  ["SUPER+SHIFT + T" "kitten quick-access-terminal"]
  ["SUPER + E" fileManager]
  ["SUPER+SHIFT + E" editor]
  ["SUPER + W" browser]
  ["SUPER + O" (detach "obsidian")]
  ["SUPER+SHIFT + P" "hyprpicker -a"]

  # Screen Cap
  ["SUPER + R" "${shell} -c screenrec-toggle"]
  ["SUPER + S" "${shell} -c screencap-region"]
  ["SUPER+SHIFT + S" "${shell} -c screencap-window"]
  ["Print" "${shell} -c screencap-screen"]

  # Windows & Workspaces
  ["SUPER + J" { layout = "togglesplit";} ]

  ["SUPER + mouse_down" {focus.workspace = "r-1";} ]
  ["SUPER + mouse_up" {focus.workspace = "r+1";} ]
  ["SUPER + C" {focus.workspace = "empty";} ]
  ["SUPER+SHIFT + C" {window = ["move" {workspace = "empty";}];} ]

  ["SUPER + D" { "workspace.toggle_special" = "discord"; }]
  ["SUPER+SHIFT + D" { "window.move".workspace = "special:discord"; }]
  ["SUPER + M" { "workspace.toggle_special" = "music"; }]
  ["SUPER+SHIFT + M" { "window.move".workspace = "special:music"; }]
]
++
map mkEmptyDspBind [
  ["SUPER + F" "window.fullscreen"]
  ["SUPER + Q" "window.close"]
  ["SUPER + mouse:272" "window.drag" ["mouse"]]
  ["SUPER + mouse:273" "window.resize" ["mouse"]]
]
++ # Switch/move workspace with num keys
(builtins.foldl'
  (list: num:
    list ++
    [
      ["SUPER + ${num}" {focus.workspace = num;} ]
      ["SUPER+SHIFT + ${num}" {window = ["move" {workspace = num;}];} ]
    ])
  []
  (map builtins.toString (lib.lists.range 0 9))
)
++ # Move focus/window w/ arrow keys
(builtins.foldl'
  (list: direction:
    list ++
    [
      ["SUPER + ${direction}" {focus.direction = direction;} ]
      [
        "SUPER+SHIFT + ${direction}"
        {window =
          [
            "move"
            {
              direction = direction;
              window = "activewindow";
            }
          ];
        }
      ]
    ])
  []
  ["left" "right" "up" "down"]
)
++ # Noctalia IPC Binds
map (prefixBindCmd "noctalia msg")
[
  ["SUPER + comma" "settings-toggle"]
  ["SUPER + SUPER_L" "panel-toggle launcher" ["release"]]
  ["SUPER + V" "panel-toggle clipboard"]
  ["SUPER + X" "panel-toggle control-center"]
  ["SUPER+SHIFT + W" "panel-toggle wallpaper"]
  ["SUPER+SHIFT + TAB" "panel-toggle launcher /win"]
  ["ALT + TAB" "window-switcher"]

  # Session Control
  ["SUPER + L" "session lock"]
  ["SUPER+SHIFT + L" "session lock-and-suspend"]
  ["CTRL+ALT+Delete" "pane-toggle session"]

  # Media Control
  ["SUPER + CONTROL + SPACE" "media toggle"]
  ["XF86AudioRaiseVolume" "volume-up 2" ["locked" "repeating"]]
  ["XF86AudioLowerVolume" "volume-down 2" ["locked" "repeating"]]
  ["XF86MonBrightnessUp" "brightness-up"]
  ["XF86MonBrightnessDown" "brightness-down"]
]
;}
