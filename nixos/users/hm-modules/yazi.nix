{pkgs, ...}: {
programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    plugins =
    {
        augment-command = pkgs.fetchFromGitHub {
                owner = "hankertrix";
                repo = "augment-command.yazi";
                rev = "dd2d6cf";
                hash = "sha256-sB2t3Gg+WdPG6OE8pD6VovD+x9nN21Jn8XydZZdTqCg=";
        };
        gvfs = pkgs.fetchFromGitHub {
                # NOTE: This was made using nixos-prefetch-github, and refers
                # to a specific commit. Will probably need to be manually
                # updated every now and again when sumthn breaks.
                # Latest commit (3 months old) as of July 9th 2026
                owner = "boydaihungst";
                repo = "gvfs.yazi";
	        rev = "3abc0a258f9d7aeaa453a2d0d6e103c5a305953d";
		hash = "sha256-UHneVJ+YXyDuPrZS+PZbs9n9h+VN5M2QG36FdprBkJc=";
        };
        starship = {
            package = pkgs.yaziPlugins.starship;
            setup = true;
            settings = {
                hide_flags = false;
                flags_after_prompt = true;
                config_file = "~/.config/yazi/starship-yazi.toml";
                show_right_prompt = true;
                hide_count = false;
                count_separator = " | ";
            };
        };
        git = {
            package = pkgs.yaziPlugins.git;
            setup = true;
            settings = {
                order = 1500;
            };
        };
    };

    initLua = ''
    function Linemode:size_and_mtime()
        local time = math.floor(self._file.cha.mtime or 0)
        if time == 0 then
            time = ""
        elseif os.date("%Y", time) == os.date("%Y") then
            time = os.date("%b %d %H:%M", time)
        else
            time = os.date("%b %d  %Y", time)
        end

        local size = self._file:size()
        return string.format("%s %s", size and ya.readable_size(size) or "-", time)
    end

    -- Yazi-starship Tab.build override for colored prompts
    local old_build = Tab.build
    Tab.build = function(self, ...)
        local bar = function(c, x, y)
            if x <= 0 or x == self._area.w - 1 then
                return ui.Bar(ui.Edge.TOP)
            end

            return ui.Bar(ui.Edge.TOP)
                :area(ui.Rect({
                        x = x,
                        y = math.max(0, y),
                        w = ya.clamp(0, self._area.w - x, 1),
                        h = math.min(1, self._area.h),
                        }))
                :symbol(c)
                --Stolen from "rail.lua" under yazi-plugin
                --fixes the characters being rendered as white
                :style(th.mgr.border_style)
        end

        local c = self._chunks
        self._chunks = {
            c[1]:pad(ui.Pad.y(1)),
            c[2]:pad(ui.Pad.y(1)),
            c[3]:pad(ui.Pad.y(1)),
        }

        self._base = ya.list_merge(self._base or {}, {
            bar("┬", c[2].x, c[1].y),
            bar("┴", c[2].x, c[1].bottom - 1),
            bar("┬", c[2].right - 1, c[2].y),
            bar("┴", c[2].right - 1, c[2].bottom - 1),
        })

        old_build(self, ...)
    end
    '';

    settings = {
        plugin.prepend_fetchers =
            let
            mkFetcher = url: run: group: {url = url; run = run; group = group;};
            in
            [
            (mkFetcher "*" "git" "git")
            (mkFetcher "*/" "git" "git")
            ];

        mgr = {
            linemode = "size_and_mtime";
            sort_by = "mtime";
            sort_reverse = true;
            sort_dir_first = true;
        };

        opener =
        {
            set-wallpaper = [
                {
                    run = "noctalia msg wallpaper-set %s";
                    orphan = true;
                    desc = "Set as wallpaper";
                }
            ];

            GIMP = [
                {
                    run = "gimp %s";
                    orphan = true;
                    desc = "Open in GIMP";
                }
            ];
        };

        open =
        {
            prepend_rules = [
                {
                    mime = "image/*";
                    use = ["open" "set-wallpaper" "GIMP"];
                }
            ];
        };
    };



    keymap = {
        mgr.prepend_keymap = import ./gvfsKeymapList.nix;
        mgr.append_keymap = [
        {on = [ "P" ]; run = "paste --force"; desc = "Paste w/ overwrite";}
        { on = [ "g" "C" ]; run = "cd ~/.config/dotfiles"; desc = "Goto dotfiles repo"; }
        {on = [ "g" "w"]; run = "cd ~/Pictures/Wallpapers"; desc = "Goto wallpapers";}
        {on = [ "g" "W"]; run = "cd ~/Pictures/Wallpapers/wallhaven"; desc = "Goto wallhaven";}
        { on = [ "u" ]; run = "shell --block lintree %h"; desc = "Run lintree on current directory"; }
        ];
      };
};
}
