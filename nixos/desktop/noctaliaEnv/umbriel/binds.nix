{pkgs, ...}:{
# Required Utilities
home.packages = with pkgs; [
    slurp
    grim
    wdisplays
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
    "Mod+P" = "scratchpad-toggle";
    "Mod+shift+P" = "window-toggle-scratchpad";

    "Mod+F" = "window-toggle-fullscreen";
    "Mod+Shift+F" = "window-toggle-floating";
    "Mod+Ctrl+F" = "window-focus-switch-floating";
    "Mod+L" = "workspace-set-layout:toggle";
    "Mod+Q" = "window-close";
    "Mod+M" = "spawn:wdisplays";

    # Compositor Navigation
    "Mod+W" = "window-focus-or-workspace-up";
    "Mod+A" = "window-focus-or-output-left";
    "Mod+S" = "window-focus-or-workspace-down";
    "Mod+D" = "window-focus-or-output-right";
    "Mod+Shift+W" = "column-move-to-workspace-previous";
    "Mod+Shift+A" = "window-move-or-output-left";
    "Mod+Shift+S" = "column-move-to-workspace-next";
    "Mod+Shift+D" = "window-move-or-output-right";

    "Mod+Shift+bracketleft" = "window-consume-or-expel-left";
    "Mod+Shift+bracketright" = "window-consume-or-expel-right";

    "Mod+bracketright" = "window-cycle-width";
    "Mod+bracketleft" = "window-cycle-width-back";

    "Mod+backslash" = "window-toggle-maximize";
    "Mod+shift+backslash" = "window-toggle-maximize-to-edges";

    "Mod+WheelUp" = "window-focus-or-workspace-up";
    "Mod+WheelDown" =  "window-focus-or-workspace-down";
    "Mod+Ctrl+WheelUp" = "window-focus-left";
    "Mod+Ctrl+WheelDown" ="window-focus-right";
    "Mod+Shift+WheelUp" = "column-move-left";
    "Mod+Shift+WheelDown" = "column-move-right";
    "Mod+MouseMiddle" = "overview-toggle";


    # Program Binds
    "Mod+T" = "spawn:${terminal}";
    "Mod+Shift+Q" = "spawn:kitten quick-access-terminal";
    "Mod+B" = "spawn:${browser}";
    "Mod+E" = spawnTermCmd fileManager;
    "Mod+Shift+E" = spawnTermCmd editor;
    "Mod+Shift+M" = spawnShellPass "mirror";

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

    "XF86AudioRaiseVolume" = {allow_when_locked = true; action = "spawn:noctalia msg volume-up 2";};
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

    # Panels
    "Mod+N" = {action = "submap:noctalia-panels"; repeat = false;};
    "submap[noctalia-panels],c" = {action = "spawn:noctalia msg panel-toggle yuuto/calculator:panel"; submap = "reset";};
    "submap[noctalia-panels],f" = {action = "spawn:noctalia msg panel-toggle nightwatch75/file-search:panel"; submap = "reset";};
    "submap[noctalia-panels],t" = {action = "spawn:noctalia msg panel-toggle nightwatch75/todo:panel"; submap = "reset";};
    "submap[noctalia-panels],u" = {action = "spawn:noctalia msg panel-toggle noctalia/umbriel-companion:panel"; submap = "reset";};
    "submap[noctalia-panels],w" = {action = "spawn:noctalia msg panel-toggle noctalia/wallhaven:panel"; submap = "reset";};
    "submap[noctalia-panels],n" = {action = "spawn:noctalia msg panel-toggle avivbintangaringga/nix-monitor:panel"; submap = "reset";};
    "submap[noctalia-panels],escape" = "submap:reset";

    "Mod+C" = {action = "submap:control-center"; repeat = false;};
    "submap[control-center],c" = {action = "spawn:noctalia msg panel-toggle control-center"; submap = "reset";};
    "submap[control-center],v" = {action = "spawn:noctalia msg panel-toggle control-center audio"; submap = "reset";};
    "submap[control-center],Shift+c" = {action = "spawn:noctalia msg panel-toggle control-center calendar"; submap = "reset";};
    "submap[control-center],w" = {action = "spawn:noctalia msg panel-toggle control-center weather"; submap = "reset";};
    "submap[control-center],m" = {action = "spawn:noctalia msg panel-toggle control-center media"; submap = "reset";};
    "submap[control-center],b" = {action = "spawn:noctalia msg panel-toggle control-center bluetooth"; submap = "reset";};
    "submap[control-center],n" = {action = "spawn:noctalia msg panel-toggle control-center notifications"; submap = "reset";};
    "submap[control-center],escape" = "submap:reset";

    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Ctrl+Alt+Delete" = "spawn:noctalia msg panel-toggle session";
    "Mod+comma" = "spawn:noctalia msg settings-toggle";
};}
