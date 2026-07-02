{fullBind, lua, lib, dspBind}:
let
	window = method: (lua ("hl.dsp.window." + method + "()"));
	windowArgs = method: args: (lua ("hl.dsp.window." + method + "(" + args + ")"));
	layout = name: (lua ("hl.dsp.layout(\"" + name + "\")"));
	focus = rule: (lua ("hl.dsp.focus(" + rule + ")"));
	workspaceArgs = method: args: (lua ("hl.dsp.workspace." + method + "(\"" + args + "\")"));
in [
(dspBind "mainMod" "F" (window "fullscreen"))
#(fullBind "mainMod" "X" (window "resize") "")
(dspBind "mainMod" "J" (layout "togglesplit"))
(dspBind "mainMod" "Q" (window "close"))

# Move/Resize w/ mouse
(fullBind "mainMod" "mouse:272" (window "drag") {mouse = true;})
(fullBind "mainMod" "mouse:273" (window "resize") {mouse = true;})

# Special Workspaces
(dspBind "mainMod" "D" (workspaceArgs "toggle_special" "discord"))
(dspBind "subMod" "D" (windowArgs "move" "{workspace = \"special:discord\"}"))
(dspBind "mainMod" "M" (workspaceArgs "toggle_special" "music"))
(dspBind "subMod" "M" (windowArgs "move" "{workspace = \"special:music\"}"))

# Move workspace with mouse scroll
(dspBind "mainMod" "mouse_down" (focus "{workspace = \"e-1\"}"))
(dspBind "mainMod" "mouse_up" (focus "{workspace = \"e+1\"}"))
]
++
# Move Focus w/ Arrow Keys
map (direction:
			(dspBind
				"mainMod"
				direction
				(focus ("{direction = \"" + direction + "\" }"))
				)
			)
["left" "right" "up" "down"]
++
# Switch/remove to workspace num
lib.lists.flatten (map (num:
		[
			(dspBind
				"mainMod"
				(builtins.toString num)
				(focus ("{workspace = " + builtins.toString num + "}"))
			)
			(dspBind
				"subMod"
				(builtins.toString num)
				(windowArgs "move" "{ workspace = ${builtins.toString num} }" )
			)
		]
) (lib.lists.range 0 9))
