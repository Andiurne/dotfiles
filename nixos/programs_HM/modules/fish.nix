{lib, ...}:{
  imports = [
  ./fish_functions.nix
  ./starship.nix
  ];

programs.fish = {
  enable = true;

  # I don't know how necessary it is to do shellInit again for hm.
  shellInit = ''
  set fish_greeting
  set -gx EDITOR nvim

  function starship_transient_prompt_func
    starship module character
  end

  function starship_transient_rprompt_func
    starship module time
  end
  starship init fish | source
  enable_transience
  '';
  shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake path:$XDG_CONFIG_HOME/dotfiles/nixos";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gcam = "git commit -a -m";
    gpm = "git push -u origin main";
    e = "exit";
    C = "cd ..";
  };


};

}
