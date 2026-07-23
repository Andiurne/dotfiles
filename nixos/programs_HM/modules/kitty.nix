{pkgs, ...}: {programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
        name = "JetBrainsMono Nerd Font";
        package = pkgs.nerd-fonts.jetbrains-mono;
        size = 12;
    };

    extraConfig = ''
    include themes/noctalia.conf
    '';

    quickAccessTerminalConfig = {
        grab_keyboard = "yes";
        edge = "bottom";
        background_opacity = 0.78;
    };

    settings = {
        # Cursor
        cursor = "none"; # "Reverse Video" color
        cursor_shape = "beam";
        cursor_trail = 250;

        confirm_os_window_close = 0;
        background_opacity = 0.78;
        scrollback_lines = 10000;
    };

    keybindings = {
        "Page_Up" = "scroll_page_up";
        "Page_Down" = "scroll_page_down";
    };
};}
