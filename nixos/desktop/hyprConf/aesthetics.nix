{inputs, ...}:{wayland.windowManager.hyprland.settings =
{
	config = {
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
	};

	layer_rule = [
	{
		name = "noctalia";
		match.namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$";
		ignore_alpha = 0.5;
		blur = true;
		blur_popups = true;
	}
	];

	curve = with inputs.hmHyprLib.lib;
	[
		(mkCurve "easeOutQuint" (bezierRule [0.23 1] [0.32 1]))
		(mkCurve "easeInOutCubic" (bezierRule [0.65 0.05] [0.36 1]))
		(mkCurve "linear" (bezierRule [0 0] [1 1]))
		(mkCurve "almostLinear" (bezierRule [0.5 0.5] [0.75 1]))
		(mkCurve "quick" (bezierRule [0.15 0] [0.1 1]))

		(mkCurve "easy" (springRule 1 71.2633 15.8273644))
	];

	animation = with inputs.hmHyprLib.lib;
	[
		(mkAnimation "global" 10 "default")
		(mkAnimation "border" 5.39 "easeOutQuint")
		(mkAnimation "windows" 4.79 "easy")
		(addStyle (mkAnimation "windowsIn" 4.1 "easy") "popin 87%")
		(addStyle (mkAnimation "windowsOut" 1.49 "linear") "popin 87%")
		(mkAnimation "fadeIn" 1.73 "almostLinear")
		(mkAnimation "fadeOut" 1.46 "almostLinear")
		(mkAnimation "fade" 3.03 "quick")
		(mkAnimation "layers" 3.81 "easeOutQuint")
		(addStyle (mkAnimation "layersIn" 4 "easeOutQuint") "fade")
		(addStyle (mkAnimation "layersOut" 1.5 "linear") "fade")
		(mkAnimation "fadeLayersIn" 1.79 "almostLinear")
		(mkAnimation "fadeLayersOut" 1.39 "almostLinear")
		(addStyle (mkAnimation "workspaces" 1.94 "almostLinear") "fade")
		(addStyle (mkAnimation "workspacesIn" 1.21 "almostLinear") "fade")
		(addStyle (mkAnimation "workspacesOut" 1.94 "almostLinear") "fade")
		(mkAnimation "zoomFactor" 7 "quick")
	];
};}
