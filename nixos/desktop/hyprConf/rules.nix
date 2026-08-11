{wayland.windowManager.hyprland.extraLuaFiles."byCall/rules".hl =
{
  workspace_rule = [
    {
      workspace = "special:discord";
      on_created_empty = "[silent] app2unit -- equibop";
    }
    {
      workspace = "special:music";
      on_created_empty = "[silent] app2unit -- pear-desktop";
    }
  ];

  window_rule = [
    {
      name = "suppress-maximize-events";
      match.class = ".*";
      suppress_event = "maximize";
    }
    {
      name = "fix-xwayland-drags";
      match = {
        class = "^$";
        title = "^$";
        xwayland = true;
        float = true;
        fullscreen = false;
        pin = false;
      };
    no_focus = true;
    }
  ];

};}
