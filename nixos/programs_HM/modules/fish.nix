{config, ...}:{
programs.fish = {
  enable = true;

  # I don't know how necessary it is to do shellInit again for hm.
  shellInit = ''
  set fish_greeting
  set -gx EDITOR nvim
  '';
  shellAliases = {
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gcm = "git commit -m";
    gpm = "git push -u origin main";
  };

  functions = {
    screencap-screen = ''
    hyprshot -m active -m output -o ~/Pictures/Screenshots
    '';

    screencap-region = ''
    grim -l 0 -g \"$(slurp)\" - | swappy -f - -o ~/Pictures/Screenshots/$(date +%F-%H%M%S).png
    '';

    screencap-window = ''
    hyprshot -m window --freeze --raw | swappy -f -o ~/Pictures/Screenshots/$(date +%F-%H%M%S).png
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
  };
}
