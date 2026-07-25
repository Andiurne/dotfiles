{config, lib, ...}:{
programs.fish.shellInit = ''
function starship_transient_prompt_func
    starship module character
end

function starship_transient_rprompt_func
    starship module time
    starship module cmd_duration
end

  starship init fish | source
  enable_transience
'';

programs.starship = {
  enable = true;
  enableFishIntegration = true;
  enableInteractive = true;
  configPath = "${config.xdg.configHome}/starship/starship-hm.toml";
  presets =
  [
    "nerd-font-symbols"
    "no-runtime-versions"
  ];
  settings = with rec {
    primary = "{{ colors.primary.default.hex }}";
    on_primary = "{{ colors.on_primary.default.hex }}";
    primary_fill = "(fg:${on_primary} bg:${primary})";

    secondary = "{{ colors.secondary.default.hex }}";
    on_secondary = "{{ colors.on_secondary.default.hex }}";
    secondary_fill = "(fg:${on_secondary} bg:${secondary})";

    tertiary = "{{ colors.tertiary.default.hex }}";
    on_tertiary = "{{ colors.on_tertiary.default.hex }}";
    tertiary_fill = "(fg:${on_tertiary} bg:${tertiary})";

    error = "{{ colors.error.default.hex }}";
    on_error = "{{ colors.on_error.default.hex }}";
    error_fill = "(fg:${on_error} bg:${error})";
  }; {
    add_newline = false;
    continuation_prompt = "| ";

    format = lib.concatStrings
    [
      "[╭](bold ${primary})"
      "$os$username$hostname"
      "[](fg:${primary} bg:${secondary})"
      "$directory"
      "[](fg:${secondary} bg:${tertiary})"
      "$git_branch$git_status"
      "[](${tertiary})"
      "[ $all](bright-black)"
      "$fill"
      "$time$cmd_duration$line_break"
      "$character"
    ];

    line_break.disabled = false;

    time = {
      disabled = false;
      format = "[󰥔 $time](fg:bright-black)";
      time_format = "%R";
    };

    fill = {
      symbol = " ";
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
      format = "[ $path]${secondary_fill}[ $read_only ](fg:${error} bg:${secondary})";
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
      error_symbol = "[╰](bold ${primary})[~>](bold ${error})";
    };
    cmd_duration = {
      format = "[ // $duration](bright-black)";
      show_notifications = false;
      min_time_to_notify = 45000;
      disabled = false;
      min_time = 5000;
    };
  };
};}
