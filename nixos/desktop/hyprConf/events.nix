{inputs, ...}:{wayland.windowManager.hyprland.settings.on =
with inputs.hmHyprLib.lib; [
(autostart
	[
		"noctalia"
		"snappy-switcher --daemon"
		"equibop"
		"keepassxc"
		"steam -silent"
	]
)
{
	_args = [
		"window.open"
		(lua "function(w)\n
					hl.dispatch(hl.dsp.window.move({
						workspace = \"special:discord\",
						follow = false,
						window = \"class:equibop\"
					})) \n

					hl.dispatch(hl.dsp.window.move({
						workspace = \"special:music\",
						follow = true,
						window = \"class:com.github.th_ch.youtube_music\"
					}))\n
					end
		")
	];
}
];
}
