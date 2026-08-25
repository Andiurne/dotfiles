{config, pkgs, lib, ...}:{
# Dependencies
home.packages = with pkgs; [
    grim
    rsync
    slurp
    gpu-screen-recorder
    kitty
] ++ (if config.wayland.windowManager.hyprland.enable then [pkgs.hyprshot] else []);

programs.fish.functions =
{
    syncToObelisk = ''
    rsync -Pav -e "ssh" $argv[1] andiurne@enchantedObelisk:/home/andiurne/$argv[2]
    '';

    syncToSlate = ''
    rsync -Pav -e "ssh" $argv[1] andiurne@enchantedSlate:/home/andiurne/$argv[2]
    '';

    nvimFindBase = ''
    set -l tmp (mktemp -t "yazi-chooser.XXXXX")
    command yazi ~/Code --cwd-file="$tmp"
    if read cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
        nvim
    end
    rm -f -- "$tmp"
    '';

    screenrec-toggle = ''
    if pkill -2 -f 'gpu-screen-recorder'
      true
    else
      gpu-screen-recorder -f 60 -a 'default_output|default_input' -fallback-cpu-encoding yes -w portal -o ~/Videos/Screencaps/$(date +%F-%H%M%S).mp4
    end
    '';

    run = ''
    $argv &; disown
    '';

    launch = ''
    $argv &; disown; exit
    '';


    # Yazi's shell function
    # THIS IS DONE BY SETTING SHELLWRAPPER IN YAZI'S HM
    /*y = ''
		  set tmp (mktemp -t "yazi-cwd.XXXXXX")
		  command yazi $argv --cwd-file="$tmp"
			if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
				builtin cd -- "$cwd"
			end
			command rm -f -- "$tmp"
			'';*/
    } // (if !config.wayland.windowManager.hyprland.enable then {} else {

    run = ''
    hyprctl eval "hl.dispatch(hl.dsp.exec_cmd('$argv'))"
    '';

    launch = ''
    hyprctl eval (string collect "hl.dispatch(hl.dsp.exec_cmd('$argv'))")
    exit
    '';

    screencap-screen = lib.mkIf config.programs.hyprland.enable ''
    hyprshot -m active -m output -o ~/Pictures/Screenshots
    '';

    screencap-region = lib.mkIf config.programs.hyprland.enable ''
    hyprshot -m region -z --raw | swappy -f -
    '';

    screencap-window = lib.mkIf config.programs.hyprland.enable ''
    hyprshot -m window --freeze --raw | swappy -f -
    '';
});
}
