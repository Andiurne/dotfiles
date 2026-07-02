{lib, ...}:
let
	# NOTE: mkLuaInline produces an attrset.
	# It needs to be called last
	lua = lib.generators.mkLuaInline;
	bindVarParse = bind: key: (bind + " .. \" + " + key + "\"");
	exec = cmd: (lua ("hl.dsp.exec_cmd(\"" + cmd + "\")"));
	bindMap = bind: key:
		if (bind == "mainMod") || (bind == "subMod") then
			lua (bindVarParse bind key)
		else
			bind;

	simpleBind = bind: key: cmd: {
		_args = [
			(bindMap bind key)
			(exec cmd)
		];
	};
	pvarBind = bind: key: cmd: {
		_args = [
			(bindMap bind key)
			(lua("hl.dsp.exec_cmd(\"app2unit -- \" .. " + cmd + ")"))
		];
	};
	ipcBind = mod: key: cmd: {
		_args = [
			(bindMap mod key)
			(lua ("hl.dsp.exec_cmd(ipc .. \"" + cmd + "\")"))
		];
	};
	dspBind = mod: key: dsp: {
		_args = [
			(bindMap mod key)
			dsp
		];
	};
	# NOTE: Rules are plain attrsets, not tables
	# i.e. {locked = true; ...}
	fullBind = mod: key: dsp: rule:
	{
		_args = [
			(bindMap mod key)
			dsp
			rule
		];
	};
in
{wayland.windowManager.hyprland.settings = { bind = [
(fullBind
	"XF86AudioMicMute" ""
	(exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
	{locked = true; repeating = true;}
)
]
++ (import ./keybinds_programs.nix {inherit simpleBind pvarBind;})
++ (import ./keybinds_ipc.nix {inherit ipcBind;})
++ (import ./keybinds_windows_workspaces.nix {inherit lib lua fullBind dspBind;})
;
};
}
