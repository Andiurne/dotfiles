{inputs, lib, ...}:
let
  inherit (inputs.andiurne.utils.hyprland)
    mkEmptyDspBind
    ;

  shell = "fish";
  browser = "zen-twilight";
  terminal = "kitty";
  fileManager = "${terminal} -- ${shell} -C y";
  editor = "${terminal} -- ${shell} -C $EDITOR";
  detach = cmd: "app2unit -- ${cmd}";
  esc = ["escape" {submap = "reset";}];

in {

  imports = [
    (import ./submaps/browser.nix browser)
    (import ./submaps/terminal.nix {inherit terminal shell fileManager editor;})
  ];

  wayland.windowManager.hyprland.extraLuaFiles."binds".hl =
{
  gesture = [
    {fingers = 3; direction = "horizontal"; action = "workspace";}
  ];
  bind = [
    ["SUPER + C" {submap = "noctalia_panels";}]
    ["SUPER + A" {submap = "programs";}]
    ["SUPER+ W" {submap = "browser";}]
    ["SUPER + T" {submap = "terminal";}]
    ["SUPER+SHIFT + W" {submap = "wallpaper";}]

    ["SUPER + E" fileManager]
    ["SUPER + V" editor]

    ["XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"]
    ["SUPER+backspace" {dpms = "display off";}]

    # Screen Cap Globals
    ["SUPER + R" "${shell} -c screenrec-toggle"]
    ["SUPER + S" "${shell} -c screencap-region"]
    ["SUPER+SHIFT + S" "${shell} -c screencap-window"]
    ["Print" "${shell} -c screencap-screen"]

    # Windows & Workspaces
    ["SUPER+SHIFT + E" {"window.move".workspace = "empty";} ]
    ["SUPER + J" { layout = "togglesplit";} ]
    ["SUPER + mouse_down" {focus.workspace = "e+1";} ]
    ["SUPER + mouse_up" {focus.workspace = "e-1";} ]

    ["SUPER + D" { "workspace.toggle_special" = "discord"; }]
    ["SUPER+SHIFT + D" { "window.move".workspace = "special:discord"; }]
    ["SUPER+M" { "workspace.toggle_special" = "music"; }]
    ["SUPER+SHIFT + M" { "window.move".workspace = "special:music"; }]

  ]
  ++ map mkEmptyDspBind [

    ["SUPER + F" "window.fullscreen"]
    ["SUPER + Q" "window.close"]
    ["SUPER+SHIFT + Q" "window.kill"]
    ["SUPER + mouse:272" "window.drag" ["mouse"]]
    ["SUPER + mouse:273" "window.resize" ["mouse"]]

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

  define_submap = {
    programs = {
      onDispatch = "reset";
      body = [
        ["E" (detach "obsidian")]
        ["S" "steam"]
        ["C" "hyprpicker -a"]
        ["V" "pwvucontrol"]
        esc
      ];
    };
  };
};}
