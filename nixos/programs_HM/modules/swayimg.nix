{inputs, ...}:
{
disabledModules = [ "programs/swayimg.nix" ];
imports = [ ./swayimg-hm-module.nix ];
programs.swayimg = {
    enable = true;
    viewer.drag_button = "MouseRight";
    viewer.on_key."Ctrl+a".functionBody = ''
        swayimg.exit()
    '';
    #extraLua = builtins.readFile ./swayimg.lua;
};}
