{wayland.windowManager.hyprland.extraLuaFiles."animation".hl =
{
  curve = {
    "easeOutQuint" = [[0.23 1] [0.32 1]];
    "easeInOutCubic" = [[0.65 0.05] [0.36 1]];
    "linear" = [[0 0] [1 1]];
    "almostLinear" = [[0.5 0.5] [0.75 1]];
    "quick" = [[0.15 0] [0.1 1]];

    "easy" = [1 91.2633 15.8273644];
  };

  animation = {
    "global" = [10 "default"];
    "border" = [5.39 "easeOutQuint"];
    "windows" = [4.79 "quick"];
    "windowsIn" = [4.1 "easeOutQuint" "popin 87%"];
    "windowsOut" = [1.49 "linear" "popin 87%"];
    "fadeIn" = [1.73 "almostLinear"];
    "fadeOut" = [1.46 "almostLinear"];
    "fade" = [3.03 "quick"];
    "layers" = [3.81 "easeOutQuint"];
    "layersIn" = [4 "easeOutQuint" "fade"];
    "fadeLayersIn" = [1.79 "almostLinear"];
    "fadeLayersOut" = [1.39 "almostLinear"];
    "workspaces" = [1.94 "almostLinear" "fade"];
    "workspacesIn" = [1.21 "almostLinear" "fade"];
    "workspacesOut" = [1.94 "almostLinear" "fade"];
    "zoomFactor" = [7 "quick"];
  };
};}
