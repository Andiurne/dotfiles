-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function ()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("equibop")
	hl.exec_cmd("snappy-switcher --daemon")
	--hl.exec_cmd("set -gx QT_QPA_PLATFORMTHEME qt6ct")
	hl.exec_cmd("dconf write /org/gnome/desktop/interface/cursor-theme 'King Halo X'")
end)
