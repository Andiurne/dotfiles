{programs.umbriel.settings.keybinds = {
    # Niri Functions
    "Mod+slash" = "cheatsheet-toggle";
    "Mod+Escape" = "overview toggle";
    #"Mod+Tab" = [(n "toggle-column-tabbed-display")];
    "Mod+P" = "scratchpad-toggle";
    "Mod+shift+P" = "window-toggle-scratchpad";
    #"Mod+Shift+c" [(n "spawn-sh" = "niri msg pick-color | wl-copy")];

    "Mod+F" = "window-toggle-fullscreen";
    "Mod+Q" = "window-close";

    # Niri Navigation
    "Mod+D" = [(n "focus-column-right")];
    "Mod+Shift+D" = [(n "move-column-right")];
    "Mod+A" = [(n "focus-column-left")];
    "Mod+Shift+A" = [(n "move-column-left")];
    "Mod+W" = [(n "focus-window-or-workspace-up")];
    "Mod+Shift+W" = [(n "move-column-to-workspace-up")];
    "Mod+S" = [(n "focus-window-or-workspace-down")];
    "Mod+Shift+S" = [(n "move-column-to-workspace-down")];

    "Mod+bracketright" = [(n "switch-preset-column-width")];
    "Mod+Shift+bracketright" = [(n "consume-or-expel-window-right")];
    "Mod+bracketleft" = [(n "switch-preset-column-width-back")];
    "Mod+Shift+bracketleft" = [(n "consume-or-expel-window-left")];

    "Mod+backslash" = [(n "maximize-column")];
    "Mod+shift+backslash" = [(n "maximize-window-to-edges")];

    "Mod+WheelScrollDown" = {cooldown-ms = 150;} [(n "focus-workspace-down")] ;
    "Mod+WheelScrollUp" = {cooldown-ms = 150;} [(n "focus-workspace-up")] ;
    "Mod+WheelScrollRight" = {cooldown-ms = 150;} [(n "focus-column-right")] ;
    "Mod+WheelScrollLeft" = {cooldown-ms = 150;} [(n "focus-column-left")] ;

    # Program Binds
    "Mod+T" [(n "spawn" = terminal)];
    "Mod+Shift+T" [(n "spawn-sh" = "kitten quick-access-terminal")];
    "Mod+B" [(n "spawn" = browser)];
    "Mod+E" [(n "spawn-sh" = fileManager)];
    "Mod+Shift+E" [(n "spawn-sh" = editor)];

    "Mod+O" [(n "spawn" = "obsidian")];
    "Mod+Ctrl+V" [(n "spawn" = "pwvucontrol")];
};}
