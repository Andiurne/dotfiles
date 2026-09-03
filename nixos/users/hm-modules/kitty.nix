{pkgs, ...}: {

home.sessionVariables.TERMINAL = "kitty";
programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    shellIntegration.enableFishIntegration = true;
    font = {
        name = "FantasqueSansM Nerd Font Mono";
        package = pkgs.nerd-fonts.fantasque-sans-mono;
        size = 14;
    };

    extraConfig = ''
    include themes/noctalia.conf
    '';

    quickAccessTerminalConfig = {
        grab_keyboard = "no";
        edge = "bottom";
        lines = "5";
        background_opacity = 0.58;
    };

    settings = {
        # Cursor
        cursor = "none"; # "Reverse Video" color
        cursor_shape = "beam";
        cursor_trail = 250;

        confirm_os_window_close = 0;
        remember_window_size = "no";
        background_opacity = 0.58;
        scrollback_lines = 10000;

        # Window Layout
        window_padding_width = 10;
    };

    keybindings = {
        "Page_Up" = "scroll_page_up";
        "Page_Down" = "scroll_page_down";
        "ctrl+shift+enter" = "new_window_with_cwd";
    };
};}
