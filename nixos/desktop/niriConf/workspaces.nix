kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/workspaces.kdl".text = kdl.formats.v1 [
    # Workspaces, when created, "push down"
    # i.e. here "primary" is made, then "media" is made on top of it
    (n "workspace" "Media")
    (n "spawn-sh-at-startup" "niri msg action focus-workspace 2")

    (n "spawn-at-startup" "equibop")
    (n "window-rule" [
        (n "match" {app-id = "equibop";})
        (n "open-on-workspace" "Media")
    ])
    #(n "spawn-at-startup" "zen-twilight")
    (n "window-rule" [
        (n "match" {app-id = "zen-twilight"; at-startup = true;})
        (n "open-on-workspace" "Media")
    ])
    (n "window-rule" [
        (n "match" {app-id = "com.github.th-ch.youtube-music";})
        (n "default-column-width" [(n "proportion" (1. / 3.))])
        (n "open-on-workspace" "Media")
        /*(n "background-effect" [
            (n "blur" true)
            (n "xray" true)
        ])*/
    ])
    (n "binds" [
        (n "Mod+M" [(n "focus-workspace" "Media")])
    ])
];}
