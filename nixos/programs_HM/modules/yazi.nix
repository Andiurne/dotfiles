{pkgs, ...}: {
programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    plugins =
    let
        yazi-plugins = pkgs.fetchFromGitHub {
            owner = "yazi-rs";
            repo = "plugins";
            rev = "...";
            hash = "sha256-...";
        };
    in {
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
        };

    settings = {
        mgr = {
            linemode = "size_and_mtime";
            sort_by = "mtime";
            sort_reverse = true;
            sort_dir_first = true;
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
    '';

    keymap = {
        mgr.prepend_keymap = import ./gvfsKeymapList.nix;
        mgr.append_keymap = [
        { on = [ "g" "C" ]; run = "cd ~/.config/dotfiles"; desc = "Goto dotfiles repo"; }
        {on = [ "g" "w"]; run = "cd ~/Pictures/Wallpapers"; desc = "Goto wallpapers";}
        {on = [ "g" "W"]; run = "cd ~/Pictures/Wallpapers/wallhaven"; desc = "Goto wallhaven";}
        { on = [ "u" ]; run = "shell --block lintree %h"; desc = "Run lintree on current directory"; }
        ];
      };
};
}
