-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("snappy-switcher --daemon")
	-- Make sure polkit starts
	hl.exec_cmd("systemctl --user start hyprpolkitagent")
	hl.exec_cmd("equibop")
end)

-- Spawn Equibop/YT Music and catch it if necessary
hl.workspace_rule({workspace = "special:discord", on_created_empty = "[silent] app2unit -- equibop"})
hl.workspace_rule({workspace = "special:music", on_created_empty = "[silent] app2unit -- pear-desktop"})
hl.on("window.open", function(w)
	hl.dispatch(hl.dsp.window.move({workspace = "special:discord", follow = false, window = "class:equibop"}))
	hl.dispatch(hl.dsp.window.move({workspace = "special:music", follow = true, window = "class:com.github.th_ch.youtube_music"}))
end
)
