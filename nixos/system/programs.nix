{... }: {
programs = {
    fish = {
      enable = true;
      shellInit = ''
      # Empty greeting and set editor
      set fish_greeting
      set -gx EDITOR nvim
      '';

    };

    neovim.enable = true;
  };
}
