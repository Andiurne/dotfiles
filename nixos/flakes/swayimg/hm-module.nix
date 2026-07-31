{
  config,
  lib,
  pkgs,
  options,
  ...
}:
/*
TODO

fix regex to match "extended posix regex"
see https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap09.html#tag_09_04
returns a list of the captured groups
strMatching uses this as a bool test

*/
let
  inherit (lib)
    types
    mkOption
  ;
  cfg = config.programs.swayimg;

    # Types adapted from the Lua source file upstream,
  # at github:artemsen/swayimg/extra/swayimg.lua
  # last updated from commit c99591f
  appmode_t = types.enum [
    "viewer"
    "slideshow"
    "gallery"
  ];
  color_t = types.str; #types.strMatching "^0x[abcdefABCDEF0123456789]{8}$";
  order_t = types.enum [
    "none"
    "alpha"
    "numeric"
    "mtime"
    "size"
    "random"
  ];
  vdir_t = types.enum [
    "first"
    "last"
    "next"
    "prev"
    "next_dir"
    "prev_dir"
    "random"
  ];
  fixed_scale_t = types.enum [
    "optimal"
    "width"
    "height"
    "fit"
    "fill"
    "real"
    "keep"
  ];
  fixed_position_t = types.enum [
    "center"
    "topcenter"
    "bottomcenter"
    "leftcenter"
    "rightcenter"
    "topleft"
    "topright"
    "bottomleft"
    "bottomright"
  ];
  rotation_t = types.enum [
    90
    180
    270
  ];
  bkgmode_t = types.enum [
    "extend"
    "mirror"
    "auto"
  ];
  gdir_t = types.enum [
    "first"
    "last"
    "up"
    "down"
    "left"
    "right"
    "pgup"
    "pgdown"
  ];
  aspect_t = types.enum [
    "fit"
    "fill"
    "keep"
  ];
  block_positions = [
    "topleft"
    "topright"
    "bottomleft"
    "bottomright"
  ];
  block_position_t = types.enum block_positions;
  mbutton_t = types.enum [
    "MouseLeft"
    "MouseRight"
    "MouseMiddle"
    "MouseSide"
    "MouseExtra"
    "ScrollUp"
    "ScrollDown"
    "ScrollLeft"
    "ScrollRight"
  ];
  # Has a whole regex for text in {}, implement later
  text_template_t = types.strMatching lib.concatStrings [
    "*"
  ];


  mkDisableOption = name:(mkOption {
    type = types.bool;
    default = true;
    description = "Whether to enable ${name}.";
  });

  # Common submodules
  setWindowBkgOpt = mkOption {
    type = types.either color_t bkgmode_t;
    default = "auto";
    description = ''
    Window background mode, or an explicit color.
    '';
  };

  set_text_option = mode: lib.genAttrs block_positions (position: mkOption{
        type = with types; listOf str;
        default = [];
        description = ''
        Text formatting for the `${position}` text in ${mode} mode.
        Written as a list, with string entries according to swayimg
        formatting.
        '';
        example = [
        "File:\t{name}"
        "Format:\t{format}"
        ];
  });

  on_key_option = mode: mkOption {
        type = types.attrsOf keyBinding;
        # This could include the default keybinds...
        # But it doesn't need to and that's a lot for no benefit really.
        default = {};
        description = ''
        An attribute set of keybinding submodules for ${mode} mode.
        Each binding is of the format:
        # on_key
        <name> = {
          keyDescriptor = "Return"; # Defaults to <name>
          functionBody = \'\'
            swayimg.exit()
          \'\'
        };
        '';
  };

  on_mouse_option = mode: mkOption {
    type = types.attrsOf mouseBinding;
    default = {};
    description = ''
    An attribute set of mouse binding submodules for ${mode} mode.
    The name of each submodule is used as the default for the
    keyDescriptor field.
    '';
  };

  # Identical to keybinding, just different
  # hypothetical regex. Could probably be
  # merged into a core variable.
  mouseBinding = types.submodule (
  {name, ...}:{options = {
    keyDescriptor = mkOption {
      type = types.str;
      default = name;
      example = "ScrollLeft";
      description = ''
      A keybind descriptor in the form of (<mod>+)*<mouse_key>,
      where <mouse_key> is any of:
      ``${lib.concatStringsSep "\n" mbutton_t}``
      '';
    };
    functionBody = mkOption {
      type = types.lines;
      default = null;
      description = ''
      A Lua function body triggered on the binding.
      '';
    };
  };}
  );

  keyBinding = types.submodule (
  {name, ...}:{
    options = {
      keyDescriptor = mkOption {
        type = types.str;
        /*
        Old strMatching code. It helps make sure the config is valid,
        but it also messes with theme templating. (It also doesn't work
        because it's based on Mozilla regex, not posix...)

        lib.strMatching lib.concatStrings [
        "^(?=(Ctrl+|Alt+|Shift+){0,3})"
        "(?!(Ctrl+|Alt+|Shift+)*\1)"
        "(Ctrl+|Alt+|Shift+)*"
        # Idk where they're getting "key descriptors" from
        # Find the list if possible
        "(\w|Escape|Insert|Return)$"
        ];*/
        default = name;
        description = ''
        A keybind descriptor in the format (<mod>+)*<sym> to trigger the keybind.
        Defaults to the name of the keybind, for efficient definition in the form
        of
        `on_key."Ctrl+a".functionBody = '''';`
        '';
        example = "Ctrl+a";
      };

      functionBody = mkOption {
        type = types.lines;
        default = null;
        description = ''
        A lua function body to be triggered on keypress.
        '';
      };
    };
  });

  luaFunctionCallList = with types; either list (listOf list);

  luaTypes = with types; oneOf [
    str
    number
    color_t
    luaFunctionDeclaration
    luaFunctionCall
  ];

  luaFunctionCall = types.submodule ({name, ...}: {options = {
    function = mkOption {
      type = types.str;
      default = name;
      description = ''
      Lua path of the function to call.
      '';
      example = "viewer.on_key";
    };

    arguments = mkOption {
      type = types.listOf luaTypes;
      default = [];
      description = ''
      Arguments to pass the to the function, as a list.
      '';
    };

  };});

  luaFunctionDeclaration = types.submodule (
    {name, ...}:{options = {

        name = mkOption {
          type = types.singleLineStr;
          default = name;
          description = ''
            Name of the local lua function to be declared.
          '';
        };

        parameters = mkOption {
          type = types.listOf lib.types.singleLineStr;
          default = [];
          description = ''
            A list of names of function parameters to declare.
          '';
        };

        body = mkOption {
          type = types.lines;
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
    ] "Upstream moved to a lua config. This option has been replaced by programs.swayimg.extraLua.")
    (lib.mkRemovedOptionModule [
      "programs"
      "swayimg"
      "initLua"
    ] "Renamed to extraLua to avoid ambiguity with new option syntax. Functions identically.")
  ];

  options.programs.swayimg = {
    enable = lib.mkEnableOption "swayimg";

    package = lib.mkPackageOption pkgs "swayimg" { };

    functions = mkOption {
      type = types.attrsOf luaFunctionDeclaration;
      default = { };
      description = ''
        An attribute set of user-defined lua functions, written to
        the top of {file}`XDG_CONFIG_HOME`/`configPath` (default swayimg/init.lua)
      '';
      example = lib.literalExpression ''
      # TODO: insert examples
      '';
    };

    configPath = mkOption {
      type = types.str;
      default = "swayimg/init.lua";
      description = ''
      Path to write the configuration file to, relative from {file}`XDG_CONFIG_HOME`. Useful for templating engines.
      Defaults to swayimg/init.lua
      '';
    };

    extraLua = mkOption {
      type = with types; nullOr (either path lines);
      default = "";
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
    */
    mode = mkOption {
      type = appmode_t;
      default = "viewer";
      description = ''
      The mode of swayimg on startup.
      '';
    };

    viewer = {
      default_scale = mkOption {
        type = fixed_scale_t;
        default = "optimal";
        description = ''
        The default scaling mode for images in viewer.
        '';
      };

      default_position = mkOption {
        type = fixed_position_t;
        default = "center";
        description = ''
        The default position for images in viewer.
        '';
      };

      drag_button = mkOption {
        type = mbutton_t;
        default = "MouseLeft";
        description = ''
        Mouse button to drag image.
        '';
      };

      autocenter = mkDisableOption "automatic centering.";

      loop = mkDisableOption "image list loop mode.";

      preload = mkOption {
        type = types.ints.unsigned;
        default = 1;
        description = ''
        Number of images to preload.
        '';
      };

      history = mkOption {
        type = types.ints.unsigned;
        default = 1;
        description = ''
        Number of images in history cache.
        '';
      };

      mark_color = mkOption {
        type = color_t;
        default = "0xff808080";
        description = ''
        Mark icon color.
        '';
      };

      pinch_factor = mkOption {
        type = types.number;
        default = 1;
        description = ''
        Factor to scale by for the pinch gesture.
        '';
      };

      # Set by function call
      /*set_abs_position = mkOption {
        type = luaFunctionCallList;
        default = [];
        description = ''
        Either a list of arguments to provide to a single call
        of swayimg.viewer.set_abs_position, or a list of such
        lists.
        '';
      };
      set_abs_scale = mkOption {
        type = luaFunctionCallList;
        default = [];
        desecription = ''

        '';
      };*/

      set_window_background = setWindowBkgOpt;

      set_text = set_text_option "viewer";

      set_image_chessboard = {
        size = mkOption {
          type = types.ints.unsigned;
          default = 20;
        };
        color1 = mkOption {
          type = color_t;
          default = "0xff333333";
        };
        color2 = mkOption {
          type = color_t;
          default = "0xff4c4c4c";
        };
      };


      # Bind List (list of submodules)
      on_mouse = on_mouse_option "viewer";
      on_key = on_key_option "viewer";
    };

    slideshow = {
      timeout = mkOption {
        type = types.number;
        default = 5;
        description = ''
        Timeout in seconds after which the next image should be opened.
        '';
      };

      default_scale = mkOption {
        type = fixed_scale_t;
        default = "fit";
        description = ''
        The default scaling mode used for slideshow images.
        '';
      };

      history = mkOption {
        type = types.ints.unsigned;
        default = 0;
        description = ''
        How many images to store in the history cache.
        '';
      };


      set_window_background = setWindowBkgOpt;
      set_text = set_text_option "slideshow";
      on_mouse = on_mouse_option "slideshow";
      on_key = on_key_option "slideshow";
    };

    gallery = {
      thumb_size = mkOption {
        type = types.ints.unsigned;
        default = 200;
        description = ''
        Thumbnail size of gallery images in pixels.
        '';
      };

      aspect = mkOption {
        type = aspect_t;
        default = "fill";
        description = ''
        Thumbnail aspect ratio of gallery images.
        '';
      };

      padding_size = mkOption {
        type = types.ints.unsigned;
        default = 5;
        description = ''
        Padding size in pixels between gallery images.
        '';
      };

      border_size = mkOption {
        type = types.ints.unsigned;
        default = 5;
        description = ''
        Border size in pixels of selected thumbnail.
        '';
      };

      border_color = mkOption {
        type = color_t;
        default = "0xffaaaaaa";
        description = ''
        Border color for selected thumbnail, in ARGB hex.
        '';
      };

      selected_scale = mkOption {
        type = types.number;
        default = 1.15;
        description = ''
        Scaling factor for selected thumbnail.
        '';
      };

      selected_color = mkOption {
        type = color_t;
        default = "0xff404040";
        description = ''
        Background color of the selected thumbnail, in ARGB hex.
        '';
      };

      unselected_color = mkOption {
        type = color_t;
        default = "0xff202020";
        description = ''
        Background color of unselected thumbnails, in ARGB hex.
        '';
      };

      window_color = mkOption {
        type = color_t;
        default = "0xff000000";
        description = ''
        Background color of the window in gallery mode.
        '';
      };

      pinch_factor = mkOption {
        type = types.number;
        # The default for gallery is 100?? For some reason?
        # Inspect the source code for the fuckery.
        default = 100;
        description = ''
        Pinch gesture scaling factor.
        '';
      };

      hover = mkDisableOption "mouse following.";

      cache = mkOption {
        type = types.ints.unsigned;
        default = 100;
        description = ''
        Number of image thumbnails to store in memory.
        '';
      };

      preload = lib.mkEnableOption "preloading invisible thumbnails";
      embedded_thumb = mkDisableOption "using embedded thumbnails";
      pstore = lib.mkEnableOption "persistent storage for thumbnails";

      set_text = set_text_option "gallery";
      on_mouse = on_mouse_option "gallery";
      on_key = on_key_option "gallery";
    };

    imagelist = {
      order = mkOption {
        type = order_t;
        default = "numeric";
        description = ''
        Sorting order to use when constructing the image list.
        '';
      };

      reverse = lib.mkEnableOption "reverse sorting order";
      recursive = lib.mkEnableOption "recursive directory reading";
      adjacent = lib.mkEnableOption "adding adjacent files from same dir";
      fsmon = mkDisableOption ''
        Enable file system monitoring.
      '';
    };

    text = {
      visible = mkDisableOption ''
        Whether to show the text layer on startup.
      '';

      font = mkOption {
        type = types.str;
        default = "monospace";
        description = ''
        Font name for the text overlay.
        '';
      };

      size = mkOption {
        type = types.int;
        default = 24;
        description = ''
        Font size for the text overlay.
        '';
      };

      spacing = mkOption {
        type = types.int;
        default = 0;
      };

      padding = mkOption {
        type = types.int;
        default = 10;
      };

      color = mkOption {
        type = color_t;
        default = "0xff000000";
        description = ''
        Text color in ARGB hex format;
        '';
        example = "0xff00aa99";
      };

      background = mkOption {
        type = color_t;
        default = "0x00000000";
        description = ''
        Background color for text in ARGB hex format.
        '';
        example = "0xff00aa99";
      };

      shadow = mkOption {
        type = color_t;
        default = "0x0d000000";
        description = ''
        Color of text shadow in ARGB hex format.
        '';
      };

      timeout = mkOption {
        type = types.number;
        default = 5;
        description = ''
        Time in seconds before the text layer hides.
        '';
      };

      status_timeout = mkOption {
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

    overlay = lib.mkEnableOption "overlay mode";

    dnd_button = mkOption {
      type = mbutton_t;
      default = "MouseRight";
      description = ''
        Drag-and-drop mouse binding.
      '';
      example = "MouseLeft";
    };
  };

  config =
  let
    defaultValue = attributePath:
      lib.getAttrFromPath
      (attributePath ++ ["default"])
      options.programs.swayimg
      ;

    toLuaVal = value:
    if lib.isBool value
      then lib.boolToString value
      # Check for hex number, which lua parses as an actual number
      else if builtins.isList (builtins.match "0x[abcdefABCDEF0123456789]{8}" (toString value))
        then value
      else if builtins.isString value
        then ''"${value}"''
      else toString value
    ;

    sectionToLua = section: lib.lists.flatten
    (lib.mapAttrsToList
      (attr: value:
      # Checks for function call set values
        if attr == "set_window_background" && value != defaultValue [ section attr ]
          then mkSwayimgCall section attr [(toLuaVal value)]

        else if attr == "set_image_chessboard"
          then mkSwayimgCall section attr (with value; (map toLuaVal [size color1 color1]))

        else if attr == "set_text"
          then
            lib.attrsets.mapAttrsToList
            (position: textFormat:
              if defaultValue [ section attr position ] == textFormat
                then ""
                else mkSwayimgCall section attr
                  [position ("{${lib.concatStringsSep ", " textFormat}}") ]
            )
            value

        else if (attr == "on_key") || (attr == "on_mouse")
          then
            lib.attrsets.mapAttrsToList
            (bindName: bindAttrs: mkSwayimgCall section attr
              [
              (toLuaVal bindAttrs.keyDescriptor)
              ''
              function ()
              ${bindAttrs.functionBody}
              end
              ''
              ])
            value
        else mkLuaSectionAttribute section attr
      )
      cfg.${section}
    );

    mkOnKeyCall = mode: keyDescriptor: body: mkSwayimgCall mode "on_key"
      [
        (toLuaVal keyDescriptor)
        ''
        function ()
        ${body}
        end
        ''
      ]
      /*''
      swayimg.${mode}.on_key("${keyDescriptor}", function()
        ${body}
      end)
      ''*/;

    mkSwayimgCall =
    mode: functionName: argumentList:
      let
        path = if isNull mode then "${functionName}" else "${mode}.${functionName}";
      in
      ''
      swayimg.${path}(${builtins.concatStringsSep ", " argumentList})
      ''
    ;

    # These could be merged by parsing attribute paths
    # But that would also forbid names with periods
    mkLuaGlobalAttribute = attribute:
      if (defaultValue [ attribute ] == cfg.${attribute})
      then ""
      else "swayimg.${attribute} = ${toLuaVal cfg.${attribute}}\n"
    ;
    mkLuaSectionAttribute = section: attribute:
      if (defaultValue [ section attribute ] == cfg.${section}.${attribute})
      then ""
      else "swayimg.${section}.${attribute} = ${toLuaVal cfg.${section}.${attribute}}\n"
    ;
    extraLuaText = if builtins.isPath cfg.extraLua then builtins.readFile cfg.extraLua else cfg.extraLua;
  in
  lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "programs.swayimg" pkgs lib.platforms.linux)
    ];

    home.packages = [ cfg.package ];

    xdg.configFile.${cfg.configPath} = {
      text = lib.concatStrings
      ((map mkLuaGlobalAttribute [
        "mode"
        "antialiasing"
        "decoration"
        "overlay"
        "exif_orientation"
        "dnd_button"
      ])
      ++ (sectionToLua "imagelist")
      ++ (sectionToLua "text")
      ++ (sectionToLua "viewer")
      ++
      (map (mkLuaSectionAttribute "slideshow") [
        "timeout"
        "default_scale"
        "history"
      ])
      # ++ on_key
      ++
      (map (mkLuaSectionAttribute "gallery") [
        "thumb_size"
        "aspect"
        "padding_size"
        "border_size"
        "border_color"
        "selected_scale"
        "selected_color"
        "unselected_color"
        "window_color"
        "pinch_factor"
        "hover"
        "cache"
        "preload"
        "embedded_thumb"
        "pstore"
      ])
      # ++ set_text, on_key, on_mouse
      ++
      [
        (if isNull extraLuaText then "" else extraLuaText)
      ]);
    };
  };
}
