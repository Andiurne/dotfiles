{lib, ...}: {wayland.windowManager.hyprland.settings =
let
 lua = lib.generators.mkLuaInline;
in
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
	/*{
		name = "move-hyprland-run";
		match.class = "hyprland-run";
		move = "20 monitor_h-120";
		float = true;
	}*/
];
};}
