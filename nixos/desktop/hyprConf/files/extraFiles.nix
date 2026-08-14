{inputs, lib, ...}:{
  wayland.windowManager.hyprland = {
    extraLuaFiles = {
      config = import ./config.nix;
      devmon = import ./devmon.nix;
      rules = import ./rules.nix;
      events = (import ./events.nix {inherit inputs lib;});
      animation = import ./animation.nix;
    };
  };
}
