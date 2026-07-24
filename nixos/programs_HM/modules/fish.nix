{lib, ...}:{
  imports = [ ./fish_functions.nix];

programs.fish = {
  enable = true;

  # I don't know how necessary it is to do shellInit again for hm.
  shellInit = ''
  set fish_greeting
  set -gx EDITOR nvim
  starship init fish | source
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
programs.starship = {
  enable = true;
  enableFishIntegration = true;
  enableInteractive = true;
  presets =
  [
    "nerd-font-symbols"
    "no-runtime-versions"
  ];
  settings = {
    format = "$all";
    character = {
      success_symbol = "[>](bold green)";
      error_symbol = "[~>](bold red)";
    };
    cmd_duration.disabled = true;
  };
};
}
