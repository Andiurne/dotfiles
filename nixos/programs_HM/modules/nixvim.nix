{...}:{programs.nixvim =
{
    imports = 
[ 
./nixvim_settings
];
    enable = true;
    defaultEditor = true;
    vimdiffAlias = true;
colorschemes.base16.enable = true;
extraConfigLua = ''
        require('matugen').setup()
        vim.cmd([[colorscheme ansi]])
    '';
    extraFiles = {
        "lua/matugen-template.lua" = ./nixvim_extraFiles/matugen-template.nix;
        "colors/ansi.vim" = ./nixvim_extraFiles/ansi.nix;
    };
    
};}
