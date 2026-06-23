{pkgs, ... }: {
programs = {
    fish = {
      enable = true;
      shellInit = ''
      # Empty greeting and set editor
      set fish_greeting
      set -gx EDITOR nvim

      # Hyprland launcher from tty
      # because I'm basic
      if uwsm check may-start && uwsm select;
      	exec uwsm start default
	    end
        '';
    };

    neovim.enable = true;
  };
}
