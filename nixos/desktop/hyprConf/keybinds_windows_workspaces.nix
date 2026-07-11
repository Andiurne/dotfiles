{dspBind, fullBind, window, layout, workspaceArgs, windowArgs, focus, lib}:
[
(dspBind "SUPER + F" (window "fullscreen"))
#(fullBind "SUPER + X" (window "resize") "")
(dspBind "SUPER + J" (layout "togglesplit"))
(dspBind "SUPER + Q" (window "close"))

# Move/Resize w/ mouse
(fullBind "SUPER + mouse:272" (window "drag") {mouse = true;})
(fullBind "SUPER + mouse:273" (window "resize") {mouse = true;})

# Special Workspaces
(dspBind "SUPER + D" (workspaceArgs "toggle_special" "discord"))
(dspBind "SUPER+SHIFT + D" (windowArgs "move" {workspace = "special:discord";}))
(dspBind "SUPER + M" (workspaceArgs "toggle_special" "music"))
(dspBind "SUPER+SHIFT + M" (windowArgs "move" {workspace = "special:music";}))

# Move workspace with mouse scroll
(dspBind "SUPER + mouse_down" (focus "{workspace = \"e-1\"}"))
(dspBind "SUPER + mouse_up" (focus "{workspace = \"e+1\"}"))
(dspBind "SUPER + C" (focus "{workspace = \"empty\"}"))
(dspBind "SUPER+SHIFT + C" (windowArgs "move" "{workspace = \"empty\"}"))
]
++
# Move Focus w/ Arrow Keys
map (direction:
			(dspBind
				"SUPER + ${direction}"
				(focus ("{direction = '${direction}' }"))
				)
			)
["left" "right" "up" "down"]
++
# Switch/remove to workspace num
lib.lists.flatten (map (num:
		[
			(dspBind
				"SUPER + ${builtins.toString num}"
				(focus ("{workspace = ${builtins.toString num}}"))
			)
			(dspBind
				"SUPER+SHIFT + ${builtins.toString num}"
				(windowArgs "move" "{ workspace = ${builtins.toString num} }" )
			)
		]
) (lib.lists.range 0 9))
