{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.swayimg;
  opt = lib.mkOption;
  types = lib.types;
  argbHexFormat = "^0x[a-f\d]{8}$";

  mkDisableOption = description:(opt {
    type = lib.types.bool;
    default = true;
    description = description;
  });

  keyBinding = lib.types.submodule (
  {
    options = {
      key = {
        type = lib.strMatching lib.concatStrings [
        "^(?=(Ctrl-|Alt-|Shift-){0,3})"
        "(?!(Ctrl-|Alt-|Shift-)*\1)"
        "(Ctrl-|Alt-|Shift-)*"
        # Idk where they're getting "key descriptors" from
        # Find the list if possible
        "(\w|Escape|Insert|Return)$"
        ];
        default = null;
        description = ''
        A keybind descriptor in the format (<mod>-)*<sym> to trigger the keybind.
        '';
        example = "Ctrl-a";
      };

      functionBody = opt {
        type = types.lines;
        default = null;
        description = ''
        A lua function body to be triggered on keypress.
        '';
      };
    };
  });

  luaFunctionType = lib.types.submodule (
    {name, ...}:
    {
      options = {
        name = lib.mkOption {
          type = lib.types.singleLineStr;
          default = name;
          description = ''
            Name of the local lua function to be declared.
          '';
        };

        arguments = lib.mkOption {
          type = lib.types.listOf lib.types.singleLineStr;
          default = [];
          description = ''
            A list of names of function arguments to declare.
          '';
        };

        body = lib.mkOption {
          type = lib.types.lines;
          default = ''

          '';
          description = ''
            The function body as a multiline string.
          '';
        };
      };
    }
  );
in
{
  meta.maintainers = with lib.maintainers; [ dod-101 andiurne ];

  imports = [
    (lib.mkRemovedOptionModule [
      "programs"
      "swayimg"
      "settings"
    ] "Upstream moved to a lua config. This option has been replaced by programs.swayimg.initLua.")
  ];

  options.programs.swayimg = {
    enable = lib.mkEnableOption "swayimg";

    package = lib.mkPackageOption pkgs "swayimg" { };

    /* List of options to make
    - functions.<name> ✓
    - enable_* -> *.enable = true
    - (viewer|gallery|slideshow).on_key -> <mode>.binds = [{key; function;}];
    */

    functions = opt {
      type = types.attrSetOf luaFunctionType;
      default = { };
      description = ''
        An attribute set of user-defined lua functions, written to
        the top of {file}`XDG_CONFIG_HOME`/swayimg/init.lua
      '';
      example = lib.literalExpression ''
      # TODO: insert examples
      '';
    };


    extraLua = opt {
      type = with types; nullOr (either path lines);
      default = null;
      description = ''
        Extra lua written to
        {file}`$XDG_CONFIG_HOME/swayimg/init.lua`.
        May be either a multiline string, or an import path
        to a lua file.

        See <https://github.com/artemsen/swayimg/blob/master/CONFIG.md>
        for documentation.
      '';
      example = lib.literalExpression ''
        swayimg.text.set_size(32)
        swayimg.text.set_foreground(0xffff0000)

        swayimg.viewer.set_default_scale("fill")

        swayimg.gallery.on_key("Delete", function()
          local image = swayimg.gallery.get_image()
          os.remove(image.path)
        end)
      '';
    };

    # "General Config" options, as per the example configuration
    /*
    In keeping with attempting to nix-ify the configuration more,
    I'll move the mode sub-options under, appropriately,
    swayimg.<name>.<options>
    one of which will be "isInitial," and use assertions
    to have only one be true.
    */
    viewer = {
      default_scale = opt {
      };
      default_position;
      drag_button;
      autocenter;
      loop;
      preload;
      history;
      mark_color;
      pinch_factor;

      # Settable by function call
      window_background;
      image_chessboard;
      text = {
        topleft;
        topright;
        bottomleft;
      };

      # Bind List (set of submodules)
      on_key = opt {
        type = types.attrSetOf keyBinding;
        # This could include the default keybinds...
        default = [];
        description = ''
        An attribute set of keybindings for viewer mode.
        Each binding is of the format:
        # on_key
        <name> = {
          key = "Return";
          functionBody = \'\'
            swayimg.mode = "gallery"
          \'\'
        };
        '';
      };
    };
    slideshow = {};
    gallery = {};

    imagelist = {
      order = opt {
        type = types.enum [
          "none"
          "alpha"
          "numeric"
          "mtime"
          "size"
          "random"
        ];
        default = "numeric";
        description = ''
        Sorting order to use when constructing the image list.
        '';
      };

      reverse = types.mkEnableOption "reverse sorting order";
      recursive = types.mkEnableOption "recursive directory reading";
      adjacent = types.mkEnableOption "adding adjacent files from same dir";
      fsmon = mkDisableOption ''
        Enable file system monitoring.
      '';
    };

    text = {
      visible = mkDisableOption ''
        Whether to show the text layer on startup.
      '';

      font = opt {
        type = types.str;
        default = "monospace";
        description = ''
        Font name for the text overlay.
        '';
      };

      size = opt {
        type = types.int;
        default = 24;
        description = ''
        Font size for the text overlay.
        '';
      };

      spacing = opt {
        type = types.int;
        default = 0;
      };

      padding = opt {
        type = types.int;
        default = 10;
      };

      color = opt {
        type = types.strMatching argbHexFormat;
        default = "0xff000000";
        description = ''
        Text color in ARGB hex format;
        '';
        example = "0xff00aa99";
      };

      background = opt {
        type = types.strMatching argbHexFormat;
        default = "0x00000000";
        description = ''
        Background color for text in ARGB hex format.
        '';
        example = "0xff00aa99";
      };

      shadow = opt {
        type = types.strMatching argbHexFormat;
        default = "0x0d000000";
        description = ''
        Color of text shadow in ARGB hex format.
        '';
      };

      timeout = opt {
        type = types.number;
        default = 5;
        description = ''
        Time in seconds before the text layer hides.
        '';
      };

      status_timeout = opt {
        type = types.number;
        default = 3;
        description = ''
        Time in seconds for status messages to timeout.
        '';
      };

    };

    # Yes these could've been enable options
    # but the default values are true,
    # and I want the default configuration to mirror swayimg's.
    #
    # This leads to a shorter init.lua, since if the default value
    # is left alone, we can omit the line.
    antialiasing = mkDisableOption ''
        Whether to enable antialiasing on startup.
    '';
    decoration = mkDisableOption ''
      Whether to enable window title, buttons, and borders.
    '';
    exif_orientation = mkDisableOption ''
      Whether to orient images using EXIF data.
    '';

    overlay = types.mkEnableOption "overlay mode";

    dnd_button = opt {
      type = types.enum [
        # I don't know if other mouse buttons
        # work. Or any button, for that matter. Test.
        "MouseRight"
        "MouseLeft"
      ];
      default = "MouseRight";
      description = ''
        Drag-and-drop mouse binding.
      '';
      example = "MouseLeft";
    };
  };

  config = lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "programs.swayimg" pkgs lib.platforms.linux)
    ];

    home.packages = [ cfg.package ];

    xdg.configFile."swayimg/init.lua" = lib.mkIf (cfg.initLua != null) {
      text = if builtins.isPath cfg.initLua then builtins.readFile cfg.initLua else cfg.initLua;
    };
  };
}
