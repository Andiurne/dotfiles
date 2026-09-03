templatePath: ''
[templates.nvim-base16]
input_path = "~/.config/nvim/lua/matugen-template.lua"
output_path = "~/.config/nvim/lua/matugen.lua"
post_hook = 'pkill -SIGUSR1 nvim'

[theme.templates.user.noctalia-starship]
input_path = "~/.config/starship/starship-template.toml"
output_path = "~/.config/starship/starship.toml"

[theme.templates.user.noctalia-starship-yazi]
input_path = "${templatePath}/starship-yazi.toml"
output_path = "~/.config/yazi/starship-yazi.toml"

[theme.templates.user.noctalia-swayimg]
input_path = "~/.config/swayimg/template.lua"
output_path = "~/.config/swayimg/init.lua"

[theme.templates.user.noctalia-discord-transparent]
input_path = "${templatePath}/discord-material.css"
output_path = "~/.config/equibop/themes/noctalia-material-transparent.theme.css"

[theme.templates.user.noctalia-discord-translucent]
input_path = "${templatePath}/discord-translucent.css"
output_path = "~/.config/equibop/themes/noctalia-translucent.theme.css"

[theme.templates.user.umbriel]
input_path = "${templatePath}/umbriel.toml"
output_path = "~/.config/umbriel/noctalia.toml"
''
