{pkgs, ...}:{
# Required Utilities
home.packages = with pkgs; [
    slurp
    grim
    ];

programs.umbriel.settings.keybinds = let
    terminal = "kitty";
    shell = "fish";
    spawnShellPass = cmd: "spawn:${shell} -C '${cmd}'";
    browser = "zen-twilight";
    spawnTermCmd = cmd:
        "spawn:${terminal} -- ${shell} -C '${cmd}'";
    fileManager = "y";
    editor = "nvim";
    screenshot = "spawn:fish -c 'grim -g (slurp) - | swappy -f -'";
in {
    # Compositor Functions
    "Mod+slash" = "cheatsheet-toggle";
    "Mod+Escape" = "overview-toggle";
    #"Mod+Tab" = [(n "toggle-column-tabbed-display")];
    "Mod+P" = "scratchpad-toggle";
    "Mod+shift+P" = "window-toggle-scratchpad";
    #"Mod+Shift+c" [(n "spawn-sh" = "niri msg pick-color | wl-copy")];

    "Mod+F" = "window-toggle-fullscreen";
    "Mod+Q" = "window-close";

    # Compositor Navigation
    "Mod+W" = "window-focus-or-workspace-up";
    "Mod+A" = "window-focus-or-output-left";
    "Mod+S" = "window-focus-or-workspace-down";
    "Mod+D" = "window-focus-or-output-right";
    "Mod+Shift+W" = "column-move-to-workspace-previous";
    "Mod+Shift+A" = "window-move-or-output-left";
    "Mod+Shift+S" = "column-move-to-workspace-next";
    "Mod+Shift+D" = "window-move-or-output-right";

    "Mod+Shift+bracketright" = "window-consume-right";
    "Mod+Shift+bracketleft" = "window-consume-left";

    "Mod+bracketright" = "window-cycle-width";
    "Mod+bracketleft" = "window-cycle-width-back";

    "Mod+backslash" = "window-toggle-maximize";
    "Mod+shift+backslash" = "window-toggle-maximize-to-edges";

    "Mod+WheelUp" = "window-focus-left";
    "Mod+WheelDown" = "window-focus-right";
    "Mod+Ctrl+WheelUp" = "window-focus-or-workspace-up";
    "Mod+Ctrl+WheelDown" = "window-focusor-workspace-down";
    "Mod+Shift+WheelUp" = "column-move-left";
    "Mod+Shift+WheelDown" = "column-move-right";
    "Mod+MouseMiddle" = "overview-toggle";


    # Program Binds
    "Mod+T" = "spawn:${terminal}";
    "Mod+Shift+T" = "spawn:kitten quick-access-terminal";
    "Mod+B" = "spawn:${browser}";
    "Mod+E" = spawnTermCmd fileManager;
    "Mod+Shift+E" = spawnTermCmd editor;

    "Mod+O" = "spawn:obsidian";
    "Mod+Ctrl+V" = "spawn:pwvucontrol";

    "Mod+Ctrl+A" = spawnTermCmd "ani-cli";
    "Super+Alt+A" = spawnTermCmd "ani-cli -C";

    # Screencap
    "Mod+R" = spawnShellPass "screenrec-toggle";
    "Print" = screenshot;
    "Menu" = screenshot;

    # Media Control
    "XF86AudioMicMute" = "spawn:wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
    "Mod+Ctrl+Space" = "spawn:noctalia msg media toggle";

    "XF86AudioRaiseVolume" = {allow-when-locked = true; action = "spawn:noctalia msg volume-up 2";};
    "Mod+equal" = {allow_when_locked = true; action = "spawn:noctalia msg volume-up 2";};

    "XF86AudioLowerVolume" = {allow_when_locked = true; action = "spawn:noctalia msg volume-down 2";};
    "Mod+minus" = {allow_when_locked = true; action = "spawn:noctalia msg volume-down 2";};

    "XF86AudioMute" = {allow_when_locked = true; action = "spawn:noctalia msg volume-mute";};
    "Mod+0" = {allow_when_locked = true; action = "spawn:noctalia msg volume-mute";};

    "XF86MonBrightnessUp" = {allow_when_locked = true; action = "spawn:noctalia msg brightness-up 5";};
    "Mod+Shift+equal" = {allow_when_locked = true; action = "spawn:noctalia msg brightness-up 5";};
    "XF86MonBrightnessDown" = {allow_when_locked = true; action = "spawn:noctalia msg brightness-down 5";};
    "Mod+Shift+minus" = {allow_when_locked = true; action = "spawn:noctalia msg brightness-down 5";};

    # Noctalia
    "Mod+space" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+Ctrl+W" = "spawn:noctalia msg panel-toggle wallpaper";
    "Mod+Shift+comma" = "spawn:noctalia msg wallpaper-previous";
    "Mod+Shift+period" = "spawn:noctalia msg wallpaper-next";

    "Mod+C" = {action = "submap:control-center"; repeat = false;};
    "submap[control-center],c" = "spawn:noctalia msg panel-toggle control-center";
    "submap[control-center],Shift+c" = "spawn:noctalia msg panel-toggle control-center calendar";
    "submap[control-center],w" = "spawn:noctalia msg panel-toggle control-center weather";
    "submap[control-center],m" = "spawn:noctalia msg panel-toggle control-center media";
    "submap[control-center],b" = "spawn:noctalia msg panel-toggle control-center bluetooth";
    "submap[control-center],n" = "spawn:noctalia msg panel-toggle control-center notifications";

    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Ctrl+Alt+Delete" = "spawn:noctalia msg panel-toggle session";
    "Mod+comma" = "spawn:noctalia msg settings-toggle";
};}
