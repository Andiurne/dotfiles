{pkgs, ...}: {
programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    #shellWrapperName = "y";

    plugins = let yazi-plugins = pkgs.fetchFromGitHub {
        owner = "yazi-rs";
        repo = "plugins";
        rev = "...";
        hash = "sha256-...";
      }; in {
          gvfs = pkgs.fetchFromGitHub {
              # NOTE: This was made using nixos-prefetch-github, and refers
              # to a specific commit. Will probably need to be manually
              # updated every now and again when sumthn breaks.
                owner = "boydaihungst";
                repo = "gvfs.yazi";
	        rev = "3abc0a258f9d7aeaa453a2d0d6e103c5a305953d";
		hash = "sha256-UHneVJ+YXyDuPrZS+PZbs9n9h+VN5M2QG36FdprBkJc=";
            };
        };

    settings = {

      };

    keymap = {
        mgr.prepend_keymap = import ./gvfsKeymapList.nix;
        mgr.append_keymap = [
        { on = [ "g" "C" ]; run = "cd ~/.config/dotfiles"; desc = "Goto dotfiles repo"; }
        ];
      };
};
}
