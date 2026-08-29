{programs.umbriel.settings = {
window_rule = [
   {
      match.app_id = "UmbrielSharePicker|xdg-desktop-portal|input-terminal";
      blur = true;
      default_floating = true;
      default_position = {x = 0; y = 0; anchor = "center";};
      default_width = 0.333;
      default_height = 0.333;
   }
   {
      match.app_id = "^dev.noctalia";
      blur = true;
   }
   {
       match.app_id = "equibop|youtube-music";
       default_workspace = 1;
   }
   {
      match.app_id = "steam";
      default_position = {x = 0; y = 0; anchor = "bottom_right";};
      default_focused = false;
   }
   {
      match.app_id = "kitty";
      default_width = 1. / 3.;
      blur = true;
   }
];
};}
