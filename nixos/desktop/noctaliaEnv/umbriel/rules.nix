{programs.umbriel.settings = {
window_rule = [
   {
       match.app_id = "equibop|youtube-music";
       default_workspace = 1;
   }
   {
      match.app_id = "steam";
      default_position = {x = 0; y = 0; anchor = "bottom_right";};
   }
   {
      match.app_id = "kitty";
      default_width = 1. / 3.;
      blur = true;
   }
];
};}
