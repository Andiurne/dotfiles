{inputs, lib, ...}:
with inputs.hmHyprLib.lib; {wayland.windowManager.hyprland.settings = { bind = [
(fullBind
	"XF86AudioMicMute"
	(exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
	{locked = true; repeating = true;}
)
]
++ (import ./keybinds_programs.nix {inherit simpleBind pvarBind;})
++ (import ./keybinds_ipc.nix {inherit ipcBind addFlags;})
++ (import ./keybinds_windows_workspaces.nix
{inherit
dspBind
fullBind
window
layout
workspaceArgs
windowArgs
focus
lib;})
;
};
}
