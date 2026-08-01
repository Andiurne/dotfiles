{inputs, pkgs, lib, ...}:
let
    bg = "0x00000000";
in {
disabledModules = [ "programs/swayimg.nix" ];
imports = [ ./swayimg-hm-module.nix ];
programs.swayimg = {
    enable = true;
    package = pkgs.swayimg.overrideAttrs {
        src = pkgs.fetchFromGitHub {
            tag = "v5.5";
            owner = "artemsen";
            repo = "swayimg";
            hash = "sha256-PaxVcuEafLdUETSG78lGSaDukPv/2m1TUbfvpBZTT40=";
        };
        version = "v5.5";
    };

    functions = {
        delete = {
            parameters = ["img"];
            body = ''if img ~= nil then os.remove(img.path) end'';
        };

        repExt = {
            parameters = [ "path" "ext" ];
            body = ''
            local revPath = string.reverse(path)
            local revNoExt = string.match(revPath, "%..*")
            do return string.reverse(string.reverse(ext) .. revNoExt) end'';
        };

        wlcopy = {
            parameters = ["path"];
            body = ''os.execute("cat" .. path .. " | wl-copy")'';
        };

        move = {
            parameters = ["direction"];
            body = ''
                local wSize = swayimg.get_window_size()
                local pos = swayimg.viewer.get_position()
                local dx, dy = math.ceil(wSize.width/20), math.ceil(wSize.height/20)
                local move_tbl = {
                    ["Up"] = {x = pos.x, y = pos.y+dy},
                    ["Down"] = {x = pos.x, y = pos.y-dy},
                    ["Left"] = {x = pos.x + dx, y = pos.y},
                    ["Right"] = {x = pos.x - dx, y = pos.y}
                }
                local newPos = move_tbl[direction]
                swayimg.viewer.set_abs_position(newPos.x, newPos.y)'';
        };
    };

    overlay = true;
    antialiasing = true;

    imagelist = {
        order = "mtime";
        reverse = true;
        recursive = false;
        adjacent = true;
    };

    viewer = {
        set_window_background = bg;
        drag_button = "MouseLeft";
        on_key = {
            "q" = "swayimg.exit()";
            "Delete" = "delete(swayimg.viewer.get_image())";
            "Left" = ''swayimg.viewer.open("prev")'';
            "Right" = ''swayimg.viewer.open("next")'';
            "c" = ''wlcopy(swayimg.viewer.get_image().path)'';

            "Ctrl+c" = ''
                local imgPath = swayimg.viewer.get_image().path
                local pngPath = repExt(imgPath, "png")
                os.execute("ffmpeg -i " .. imgPath .. " " .. pngPath .. "; rm " .. imgPath)
                wlcopy(pngPath)'';

            "Shift+c" = ''os.execute("wl-copy " .. swayimg.viewer.get_image().path)'';

            "Shift+Up" = ''move("Up")'';
            "Shift+Down" = ''move("Down")'';
            "Shift+Left" = ''move("Left")'';
            "Shift+Right" = ''move("Right")'';

            "Ctrl+Right" = "swayimg.viewer.rotate(90)";
            "Ctrl+Left" = "swayimg.viewer.rotate(270)";
            "Ctrl+Up" = "swayimg.viewer.flip_vertical()";
            "Ctrl+Down" = "swayimg.viewer.flip_horizontal()";
        };
    };

    gallery = {
        window_color = "0x00000000";
        on_key = {
            "q" = "swayimg.exit()";
            "Delete" = "delete(swayimg.gallery.get_image())";
        };
    };
    #extraLua = builtins.readFile ./swayimg.lua;
};}
