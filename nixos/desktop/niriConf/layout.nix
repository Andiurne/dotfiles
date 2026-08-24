kdl: let inherit (kdl.dsl) n; in {xdg.configFile."niri/layout.kdl".text = kdl.formats.v1 [
    (n "layout" [
        (n "gaps" 16)
        (n "default-column-display" "tabbed")
        (n "always-center-single-column")
        (n "tab-indicator" [
            (n "hide-when-single-tab")
        ])
        (n "preset-column-widths" [
            (n "proportion" (1. / 3.))
            (n "proportion" (1. / 2.) )
            (n "proportion" (2. / 3.))
            (n "proportion" 1.0)
        ])
    ])
];}
