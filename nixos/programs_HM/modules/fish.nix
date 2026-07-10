{config, ...}:{
  imports = [ ./fish_functions.nix];

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
    gcam = "git commit -a -m";
    gpm = "git push -u origin main";
  };

  };
}
