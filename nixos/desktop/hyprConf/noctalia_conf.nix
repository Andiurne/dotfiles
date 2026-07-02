{...}:{wayland.windowManager.hyprland.settings = {
config = {
	xwayand.force_zero_scalaing = true;
	general = {
		gaps_in = 5;
		gaps_out = 10;

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

	animations.enabled = true;
};

curve = [

];

layer_rule = [
{
	name = "noctalia";
	match.namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd)$";
	ignore_alpha = 0.5;
	blur = true;
	blur_popups = true;
}
];
};
}
