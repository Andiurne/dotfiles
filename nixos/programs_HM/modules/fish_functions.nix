{config, pkgs, ...}:{
# Dependencies
home.packages = with pkgs; [
    grim
    hyprshot
    slurp
    gpu-screen-recorder
    kitty
];

programs.fish.functions =
{
    nvimFindBase = ''
    set -l tmp (mktemp -t "yazi-chooser.XXXXX")
    command yazi ~/Code --cwd-file="$tmp"
    if read cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
        nvim
    end
    rm -f -- "$tmp"
    '';

    screencap-screen = ''
    hyprshot -m active -m output -o ~/Pictures/Screenshots
    '';

    screencap-region = ''
    hyprshot -m region -z --raw | swappy -f -
    '';

    screencap-window = ''
    hyprshot -m window --freeze --raw | swappy -f -
    '';

    screenrec-toggle = ''
    if pkill -2 -f 'gpu-screen-recorder'
      true
    else
      gpu-screen-recorder -f 60 -a 'default_output|default_input' -fallback-cpu-encoding yes -w portal -o ~/Videos/Screencaps/$(date +%F-%H%M%S).mp4
    end
    '';

    run = ''
    hyprctl eval "hl.dispatch(hl.dsp.exec_cmd('$argv'))"
    '';

    launch = ''
    hyprctl eval (string collect "hl.dispatch(hl.dsp.exec_cmd('$argv'))")
    exit
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
    };
}
