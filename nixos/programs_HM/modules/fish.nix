{config, pkgs,...}:{
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
