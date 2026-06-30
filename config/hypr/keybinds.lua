local terminal    = "foot"
local fileManager = "foot -- fish -C y"
local browser = "zen-twilight"
mainMod = "SUPER" -- Sets "Windows" key as main modifier

------------
-- PROGRAM BINDS
-- ---------
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("app2unit -- " .. terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("app2unit -- " .. fileManager))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("app2unit -- " .. browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("app2unit -- obsidian"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("app2unit -- github-desktop"))

-- Color Picker (unexpectedly useful)
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

-- Screen Capture Modes
-- Video
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("if pkill -2 -f 'gpu-screen-recorder'; true; else; gpu-screen-recorder -f 60 -a 'default_output|default_input' -fallback-cpu-encoding yes -w portal -o ~/Videos/Screencaps/$(date +%F-%H%M%S).mp4; end"))
-- Window
hl.bind(mainMod .. " + SHIFT + S", function()
   -- hl.config({cursor={invisible = true}})
    -- This'll work after 0.55... hl.exec_scheduled_prop_refresh_immediately()
    hl.dispatch(hl.dsp.exec_cmd("hyprshot -m window --freeze --raw | swappy -f - -o ~/Pictures/Screenshots/$(date +%F-%H%M%S).png"))
    --hl.config({cursor={invisible = false}})
end
)
-- Region
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("grim -l 0 -g \"$(slurp)\" - | swappy -f - -o ~/Pictures/Screenshots/$(date +%F-%H%M%S).png"))
-- Fullscreen
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m active -m output -o ~/Pictures/Screenshots"))

-- Alt+Tab (standard MRU)
hl.bind("ALT + Tab", hl.dsp.exec_cmd("snappy-switcher next --mod alt"))
-- Super+Tab (workspace-filtered)
hl.bind("SUPER + TAB", hl.dsp.exec_cmd("snappy-switcher next --workspace --mod super"))

-------------------
--- NOCTALIA BINDS
--- ---------------
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- IPC Keybinds
local ipc = "noctalia msg"

-- Core binds
hl.bind(mainMod .. "+comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))
hl.bind(mainMod .. "+SHIFT+R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. "+SUPER_L", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"), {special = "release"})
hl.bind(mainMod .. "+V", hl.dsp.exec_cmd(ipc .. " panel-toggle clipboard"))
hl.bind(mainMod .. "+C", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. "+SHIFT+W", hl.dsp.exec_cmd(ipc.. " panel-toggle wallpaper"))
hl.bind(mainMod .. "+SHIFT+TAB", hl.dsp.exec_cmd(ipc.." panel-toggle launcher /win "))
-- Session Binds
hl.bind(mainMod .. "+L", hl.dsp.exec_cmd(ipc .. " session lock"))
hl.bind("SUPER+SHIFT+L", hl.dsp.exec_cmd(ipc .. " session lock-and-suspend"))
hl.bind("SUPER+Delete", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))

-- Media
hl.bind(mainMod .. " + CONTROL + SPACE", hl.dsp.exec_cmd(ipc .. " media toggle"))
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up 2"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down 2"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"))


----------
-- WINDOW ACTIONS
-- -----
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + X", hl.dsp.window.resize())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only
hl.bind(mainMod .. " + Q", hl.dsp.window.close())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------
---WORKSPACES
--------------

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- SPECIAL WORKSPACES
hl.bind(mainMod .. " + D",         hl.dsp.workspace.toggle_special("discord"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:discord" }))

hl.bind(mainMod .. " + M",         hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }))


-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e+1" }))

--------------
-- RANDOM APPS
-- -----------
