{inputs, lib, ...}:
with inputs.hmHyprLib.lib; {wayland.windowManager.hyprland.settings = { bind =
(map (x: addFlags x {locked = true;})
[
(dspBind
	"XF86AudioMicMute"
	(exec "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
)
(dspBind
	"SUPER+Backspace"
	(dspCallArgs "dpms" "'display off'")
)
])
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
