{config, lib, ...}:{programs.starship = {
  enable = true;
  enableFishIntegration = true;
  enableInteractive = true;
  configPath = "${config.xdg.configHome}/starship/starship-hm.toml";
  presets =
  [
    #"nerd-font-symbols"
    "no-runtime-versions"
  ];
  settings = let
    primary = "{{ colors.primary.default.hex }}";
    on_primary = "{{ colors.on_primary.default.hex }}";
    primary_fill = "(fg:{{ colors.on_primary.default.hex }} bg: {{ colors.primary.default.hex }})";

    secondary = "{{ colors.secondary.default.hex }}";
    on_secondary = " {{ colors.on_secondary.default.hex }}";
    secondary_fill = "(fg:{{ colors.on_secondary.default.hex }} bg: {{ colors.secondary.default.hex }})";

    tertiary = "{{ colors.tertiary.default.hex }}";
    on_tertiary = " {{ colors.on_tertiary.default.hex }}";
    tertiary_fill = "(fg:{{ colors.on_tertiary.default.hex }} bg: {{ colors.tertiary.default.hex }})";

    error = "{{ colors.error.default.hex }}";
    on_error = " {{ colors.on_error.default.hex }}";
    error_fill = "(fg:{{ colors.on_error.default.hex }} bg: {{ colors.error.default.hex }})";
  in {
    add_newline = true;
    continuation_prompt = "| ";

    /*palette = "noctalia";
    palettes.noctalia = {

    };*/

    format = lib.concatStrings
    [
      "[╭](bold ${primary})"
      "$os$username$hostname"
      "[](fg:${primary} bg:${secondary})"
      "$directory"
      "[](fg:${secondary} bg:${tertiary})"
      "$git_branch$git_status"
      "$fill"
      "$time$cmd_duration$line_break"
      "$character"
    ];

    line_break.disabled = false;

    time = {
      disabled = false;
      format = "[󰥔 $time](fg:bright-black)";
    };

    env_var = {
      disabled = true;
      format = "[$symbol](${primary})";
      symbol = "╭";
      variable = "SHELL";
    };

    os = {
      disabled = false;
      format = "[$symbol]${primary_fill}";
      symbols = {
        NixOS = "";
        Windows = "";
        Arch = "󰣇";
        Ubuntu = "";
        Unknown = "󰠥";
      };
    };

    username = {
      disabled = false;
      style_user = "primary";
      style_root = "error";
      format = "[/ $user]${primary_fill}";
      show_always = false;
    };

    hostname = {
      disabled = false;
      ssh_only = true;
      format = "[@$hostname]${primary_fill}";
    };

    directory = {
      truncation_length = 3;
      truncation_symbol = "../";
      home_symbol = "~";
      read_only = "";
      format = "[ $path]${secondary_fill}[ read_only ](fg:${error} bg:${secondary})";
    };

    git_branch = {
      symbol = " ";
      format = ''[ $symbol\[$branch\]]${tertiary_fill}'';
    };

    git_status = {
      disabled = false;
      format = "[: $all_status $ahead_behind ]${tertiary_fill}";
      conflicted = "!!!";
      up_to_date = "";
      untracked = " ";
      ahead = "⇡\${count}";
      diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      behind = "⇣\${count}";
      stashed = " ";
      modified = " ";
      staged = "[++\($count\)]${tertiary_fill}";
      renamed = "󰑕 ";
      deleted = " ";
    };

    character = {
      success_symbol = "[╰->](bold ${primary})";
      error_symbol = "[╰~>](bold ${error})";
    };
    cmd_duration.disabled = true;
  };
};}
