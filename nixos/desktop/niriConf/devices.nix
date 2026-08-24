kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/devices.kdl".text = kdl.formats.v1 [
    (n "input" [
        (n "keyboard" [
            (n "xkb" [
                (n "layout" "us")
                (n "model" "")
                (n "rules" "")
                (n "variant" "altgr-intl")
            ])
            (n "repeat-delay" 600)
            (n "repeat-rate" 25)
            (n "track-layout" "global")
        ])
        (n "touchpad" [
            (n "tap")
            (n "natural-scroll")
        ])
        (n "warp-mouse-to-focus")
        (n "focus-follows-mouse")
    ])
    (n "output" "Acer Technologies XV272U V3 A513088793LEJ" [
        (n "transform" "normal")
        (n "mode" "2560x1440@180.001")
    ])
];}
