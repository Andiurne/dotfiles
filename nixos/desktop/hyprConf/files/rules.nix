{
  hl.workspace_rule = [
    {
      workspace = "special:discord";
      on_created_empty = "[silent] app2unit -- equibop";
    }
    {
      workspace = "special:music";
      on_created_empty = "[silent] app2unit -- pear-desktop";
    }
  ];

  hl.layer_rule = [
    {
      name = "noctalia";
		  match.namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$";
      ignore_alpha = 0.5;
      blur = true;
      blur_popups = true;
    }
  ];

  hl.window_rule = [
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

}
