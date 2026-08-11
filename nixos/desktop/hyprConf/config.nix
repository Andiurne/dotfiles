{wayland.windowManager.hyprland.extraLuaFiles."byCall/config".hl.config = {
  input = {
    kb_layout = "us";
    kb_variant = "altgr-intl";
    #kb_model = "";
    #kb_options = "";
    #kb_rules = "";

    follow_mouse = 1;
    sensitivity = 0;
    touchpad = {
      natural_scroll = true;
    };
  };

  misc = {
    force_default_wallpaper = 0;
    disable_hyprland_logo = false;
  };

  xwayland.force_zero_scaling = true;

  general = {
    gaps_in = 5;
    gaps_out = 15;

    border_size = 2;

    resize_on_border = false;
    allow_tearing = false;
    layout = "dwindle";
  };

  decoration = {
    rounding = 10;
    rounding_power = 2;

    shadow = {
      enabled = true;
      range = 4;
      render_power = 3;
      color = "0xee1a1a1a";
    };

    blur = {
      enabled = true;
      size = 3;
      passes = 2;
      vibrancy = 0.1696;
    };
  };

  dwindle.preserve_split = true;
  master.new_status = "master";
  scrolling.fullscreen_on_one_column = true;
  animations.enabled = true;
};}
