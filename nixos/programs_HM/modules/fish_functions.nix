{config, pkgs, ...}:{
# Dependencies
home.packages = with pkgs; [
    grim
    hyprshot
    slurp
    gpu-screen-recorder
    foot
];

programs.fish.functions =
{
    screencap-screen = ''
    hyprshot -m active -m output -o ~/Pictures/Screenshots
    '';

    screencap-region = ''
    grim -l 0 -g "$(slurp)" - | swappy -f -
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

    reload = ''
    runKill foot (pwd)
    '';

    btrfs-mount = ''
    options = $argv[1]
    target = $argv[2]
    mountPoint = $argv[3]
    sudo mount -o $options $target $mountPoint
    '';

    run = ''
    $argv[1] & disown
    '';

    runKill = ''
    $argv[1] & disown & exit
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
