{config, pkgs,...}:{
programs.fish = {
  enable = true;

  # I don't know how necessary it is to do shellInit again for hm.
  shellInit = ''
  set fish_greeting
  set -gx EDITOR nvim    
  '';

  functions = {
    # Yazi's shell function
    y = ''
		  set tmp (mktemp -t "yazi-cwd.XXXXXX")
		  command yazi $argv --cwd-file="$tmp"
			if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
				builtin cd -- "$cwd"
			end
			command rm -f -- "$tmp"
			'';
    };
  };
}
