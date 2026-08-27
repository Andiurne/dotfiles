kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/style.kdl".text = kdl.formats.v1 [
    (n "debug" [
        (n "honor-xdg-activation-with-invalid-serial")
    ])
    (n "blur" [
        (n "passes" 2)
        (n "offset" 3.0)
        (n "noise" 0.03)
        (n "saturation" 1.0)
    ])
    (n "window-rule" [
        (n "geometry-corner-radius" 20 20 20 20)
        (n "clip-to-geometry" true)
        (n "background-effect" [
            (n "blur" true)
            (n "xray" false)
            ])
        ])

    # Static Overview Wallpaper
    (n "layer-rule" [
        (n "match" {namespace = "^noctalia-wallpaper";})
        (n "place-within-backdrop" true)
        ])
    (n "layout" [(n "background-color" "transparent")])
    (n "overview" [(n "workspace-shadow" [(n "off")])])

    (n "layer-rule" [
        (n "match" {namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd)$";})
        (n "background-effect" [(n "xray" false)])
        ])
    (n "window-rule" [
        (n "match" {app-id = "dev.noctalia.Noctalia";})
        (n "open-floating" true)
        (n "default-column-width" [(n "fixed" 1080)])
        (n "default-window-height" [(n "fixed" 920)])
        ])

    (n "window-rule" [
        (n "match" {app-id = "steam";})
        (n "open-focused" false)
        (n "default-floating-position" {
            relative-to = "bottom-right";
            x = 0;
            y = 0;
            })
        (n "geometry-corner-radius" 0 0 0 0)
        ])
    (n "window-rule" [
        (n "match" {app-id = "kitty";})
        (n "default-column-width" [(n "proportion" (1. / 3.))])
        ])
];}
