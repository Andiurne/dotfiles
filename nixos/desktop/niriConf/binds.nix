kdl:
let
    inherit (kdl.dsl) n;

    shell = "fish";
    shellPass = cmd: "${shell} -c '${cmd}'";

    terminal = "kitty";
    terminalPass = cmd: "${terminal} -- ${shell} -C '${cmd}'";

    browser = "zen-twilight";
    fileManager = terminalPass "y";
    editor = terminalPass "$EDITOR";

    noctalia = cmd: "noctalia msg ${cmd}";
    nocMsg = cmd: (n "spawn-sh" (noctalia cmd));
    nocPanel = cmd: noctalia ("panel-toggle ${cmd}");
    panelSpawn = cmd: (n "spawn-sh" (nocPanel cmd));
in {
    xdg.configFile."niri/binds.kdl".text = kdl.formats.v1 [
        (n "binds" [
            # Niri Functions
            (n "Mod+slash" [(n "show-hotkey-overlay")])
            (n "Mod+Escape" [(n "toggle-overview")])
            (n "Mod+Tab" [(n "toggle-column-tabbed-display")])
            (n "Mod+P" [(n "toggle-window-floating")])
            (n "Mod+Shift+P" [(n "switch-focus-between-floating-and-tiling")])
            (n "Mod+Shift+c" [(n "spawn-sh" "niri msg pick-color | wl-copy")])

            (n "Mod+F" [(n "fullscreen-window")])
            (n "Mod+Q" [(n "close-window")])

            # Niri Navigation
            (n "Mod+D" [(n "focus-column-right")])
            (n "Mod+Shift+D" [(n "move-column-right")])
            (n "Mod+A" [(n "focus-column-left")])
            (n "Mod+Shift+A" [(n "move-column-left")])
            (n "Mod+W" [(n "focus-window-or-workspace-up")])
            (n "Mod+Shift+W" [(n "move-column-to-workspace-up")])
            (n "Mod+S" [(n "focus-window-or-workspace-down")])
            (n "Mod+Shift+S" [(n "move-column-to-workspace-down")])

            (n "Mod+bracketright" [(n "switch-preset-column-width")])
            (n "Mod+Shift+bracketright" [(n "consume-or-expel-window-right")])
            (n "Mod+bracketleft" [(n "switch-preset-column-width-back")])
            (n "Mod+Shift+bracketleft" [(n "consume-or-expel-window-left")])

            (n "Mod+backslash" [(n "maximize-column")])
            (n "Mod+shift+backslash" [(n "maximize-window-to-edges")])

            (n "Mod+WheelScrollDown" {cooldown-ms = 150;} [(n "focus-workspace-down")] )
            (n "Mod+WheelScrollUp" {cooldown-ms = 150;} [(n "focus-workspace-up")] )
            (n "Mod+WheelScrollRight" {cooldown-ms = 150;} [(n "focus-column-right")] )
            (n "Mod+WheelScrollLeft" {cooldown-ms = 150;} [(n "focus-column-left")] )

            # Program Binds
            (n "Mod+T" [(n "spawn" terminal)])
            (n "Mod+Shift+T" [(n "spawn-sh" "kitten quick-access-terminal")])
            (n "Mod+B" [(n "spawn" browser)])
            (n "Mod+E" [(n "spawn-sh" fileManager)])
            (n "Mod+Shift+E" [(n "spawn-sh" editor)])

            (n "Mod+O" [(n "spawn" "obsidian")])
            (n "Mod+Ctrl+V" [(n "spawn" "pwvucontrol")])

            (n "Mod+Ctrl+A" [(n "spawn-sh" (terminalPass"ani-cli"))])
            (n "Super+Alt+A" [(n "spawn-sh" (terminalPass "ani-cli -c"))])

            # Screencap
            (n "Mod+R" [(n "spawn-sh" (shellPass "screenrec-toggle"))])
            (n "Print" [(n "screenshot" {show-pointer = false;})])
            (n "Menu" [(n "screenshot" {show-pointer = false;})])

            # Media Control
            (n "XF86AudioMicMute" [(n "spawn-sh" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")])
            (n "Mod+Ctrl+Space" [(nocMsg "media toggle")])

            (n "XF86AudioRaiseVolume" {allow-when-locked = true;} [(nocMsg "volume-up 2") ])
            (n "Mod+equal" {allow-when-locked = true;} [(nocMsg "volume-up 2")])

            (n "XF86AudioLowerVolume" {allow-when-locked = true;} [(nocMsg "volume-down 2") ])
            (n "Mod+minus" {allow-when-locked = true;} [(nocMsg "volume-down 2") ])

            (n "XF86AudioMute" {allow-when-locked = true;} [(nocMsg "volume-mute") ])
            (n "Mod+0" {allow-when-locked = true;} [(nocMsg "volume-mute") ])

            (n "XF86MonBrightnessUp" {allow-when-locked = true;} [(nocMsg "brightness-up 2")])
            (n "Mod+Shift+bracketright" {allow-when-locked = true;} [(nocMsg "brightness-up 2")])
            (n "XF86MonBrightnessDown" {allow-when-locked = true;} [(nocMsg "brightness-down 2")])
            (n "Mod+Shift+bracketleft" {allow-when-locked = true;} [(nocMsg "brightness-up 2")])

            # Noctalia
            (n "Mod+space" [(panelSpawn "launcher")])
            (n "Mod+Ctrl+W" [(panelSpawn "wallpaper")])
            (n "Mod+Shift+comma" [(nocMsg "wallpaper-previous")])
            (n "Mod+Shift+period" [(nocMsg "wallpaper-next")])

            (n "Mod+C" [(panelSpawn "control-center")])
            (n "Mod+V" [(panelSpawn "clipboard")])
            (n "Ctrl+Alt+Delete" [(panelSpawn "session")])
            (n "Mod+comma" [(nocMsg "settings-toggle")])
        ])
    ];
}
