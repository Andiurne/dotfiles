{pkgs, lib, ...}:{
  imports = [
  ./fish_functions.nix
  ../starship.nix
  ];

  home.packages = with pkgs; [ libnotify ];

programs.fish = {
  enable = true;

  # I don't know how necessary it is to do shellInit again for hm.
  shellInit = ''
  set fish_greeting
  set -gx EDITOR nvim
  set -gx GH_TOKEN (cat ~/.config/sops-nix/secrets/GH_TOKEN)
  '';

  shellAliases = {

  };

  shellAbbrs = {
    rebuild = lib.concatStringsSep " "
    [
      "if"
      "sudo nixos-rebuild switch"
      "--flake path:$XDG_CONFIG_HOME/dotfiles/nixos"
      ";"
      "notify-send -a \"nixos-rebuild\" -n \"nix-snowflake\""
      "\"Rebuild Completed :D\""
      "; else;"
      "notify-send -a \"nixos-rebuild\" -n \"nix-snowflake\""
      "\"Rebuild Failed :(\""
      "; end"
    ];
    nt = "kitty -d pwd";
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
