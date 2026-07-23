{config, ...}: {
programs.foot = {
	enable = true;
	settings = {
		main = {
			include = "~/.config/foot/themes/noctalia";
			shell = "fish";
			title = "foot";
			font = "JetBrainsMono Nerd Font:size=12";
			letter-spacing = 0;
			dpi-aware = "no";
			pad = "25x25";
			bold-text-in-bright = "no";
			gamma-correct-blending = "no";
		};

		scrollback.lines = 10000;

		cursor = {
			style = "beam";
			beam-thickness = 1.5;
		};

		colors-dark.alpha = 0.78;

		key-bindings = {
			scrollback-up-page = "Page_Up";
			scrollback-down-page = "Page_Down";
			search-start = "Control+Shift+slash";
		};

		search-bindings = {
			cancel = "Escape";
			find-prev = "Control+shift+n";
			find-next = "Control+n";
		};
	};
};
}
