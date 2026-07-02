{lib, ...}:{wayland.windowManager.hyprland.settings.on =
let
	lua = lib.generators.mkLuaInline;
	autostart = list: {
		_args = [
			"hyprland.start"
			(lua ("function()\n " +
				builtins.concatStringsSep " \n "
				(map (cmd: "hl.exec_cmd(\"" + cmd + "\")") list) +
				"\n end"
				))
		];
	};
in
[
(autostart
	[
		"noctalia"
		"snappy-switcher --daemon"
		"equibop"
		"keepassxc"
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
