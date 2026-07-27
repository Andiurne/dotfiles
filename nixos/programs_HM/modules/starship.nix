{config, pkgs, lib, ...}:{
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
    configPath = "${config.xdg.configHome}/starship/starship.toml";
};

home.file."${config.xdg.configHome}/starship/starship-template.toml" = {
  # Only the bullest of shits is done here, in order to properly do noctalia theming
  source =
  # Colors as formatted string for Noctalia template engine
  with rec {
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
  };
  # Call the toml generator
  (pkgs.formats.toml {}).generate "starship-template"
  {
    add_newline = false;
    continuation_prompt = "| ";

    format = lib.concatStrings
    [
      "[](bold ${secondary})"
      "[/$username$hostname]${secondary_fill}"
      "[ ](fg:${secondary} bg:${tertiary})"
      "[$directory]${tertiary_fill}"
      "[](fg:${tertiary} bg:${primary})"
      "[ $git_branch$git_status$git_state]${primary_fill}"
      "[](${primary})"
      "[>- $time$memory_usage$cmd_duration$line_break](bright-black)"
      " $character"
    ];

    line_break.disabled = false;

    memory_usage = {
      disabled = false;
      format = " - $symbol : [\${ram_pct}](bold error)";
      symbol = "";
    };

    time = {
      disabled = false;
      format = "[󰥔 $time](bright-black)";
      time_format = "%R";
    };

    fill.symbol = " ";

    env_var = {
      disabled = true;
      format = "[$symbol](${primary})";
      symbol = "╭";
      variable = "SHELL";
    };

    os = {
      disabled = true;
      format = "$symbol";
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
      format = "$user";
      show_always = true;
    };

    hostname = {
      disabled = false;
      ssh_only = true;
      format = "@$hostname";
    };

    directory = {
      truncation_length = 3;
      truncation_symbol = "../";
      home_symbol = "~";
      read_only = "";
      format = "$path[ $read_only](fg:${error} bg:${tertiary})";
    };

    git_branch = {
      symbol = "";
      format = ''$symbol\[$branch\]'';
    };

    git_status = {
      disabled = false;
      format = ":$all_status $ahead_behind ";
      conflicted = "!!! ";
      up_to_date = "󰔓 ";
      untracked = " ";
      ahead = "⇡\${count}";
      diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      behind = "⇣\${count}";
      stashed = " ";
      modified = " ";
      staged = "++\($count\)";
      renamed = "󰑕 ";
      deleted = " ";
    };

    git_state.disabled = false;

    character = {
      success_symbol = "[↳](bold ${primary})";
      error_symbol = "[↳](bold ${error})";
    };
    cmd_duration = {
      format = "[ - $duration](bright-black)";
      show_notifications = false;
      min_time_to_notify = 45000;
      disabled = false;
      min_time = 5000;
    };
  };
};
}
