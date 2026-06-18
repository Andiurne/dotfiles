{pkgs, ...}: 
{
programs.obsidian = {
    enable = true;
    defaultSettings = {
      app = ''
        {
  "alwaysUpdateLinks": true,
  "strictLineBreaks": true,
  "newFileLocation": "current",
  "showUnsupportedFiles": false,
  "readableLineLength": true,
  "useTab": true,
  "showInlineTitle": false,
  "propertiesInDocument": "hidden",
  "vimMode": true,
  "useMarkdownLinks": true,
  "showLineNumber": true,
  "newLinkFormat": "relative",
  "spellcheck": true,
  "pdfExportSettings": {
    "pageSize": "Letter",
    "landscape": false,
    "margin": "0",
    "downscalePercent": 100
  }
}
      '';
      appearance = ''
{
  "theme": "system",
  "nativeMenus": false,
  "cssTheme": "Encore",
  "accentColor": "#e28512",
  "textFontFamily": "Times New Roman,Corbel",
  "baseFontSize": 16
}
      '';

      themes = [
        "encore-settings"
      ];

      communityPlugins = [
        "table-editor-obsidian"
        "dynamic-outline"
        "obsidian-relative-line-numbers"
        {
          pkg = "obsidian-style-settings";
          enable = true;
          settings = ''
          {
  "encore-settings@@theme-dark": "encore-theme-dark-glass-royale",
  "encore-settings@@colors": "encore-colors-custom",
  "encore-settings@@encore-translucency": true,
  "encore-settings@@encore-translucency-background": "encore-bg-image",
  "encore-settings@@encore-highlight-border": true,
  "encore-settings@@encore-bright-accent": false,
  "encore-settings@@blur-amount": "encore-blur-full",
  "encore-settings@@encore-translucency-blur-amount": 0,
  "encore-settings@@encore-translucency-image": "url(\"https://i.imgur.com/SCnexUI.jpeg\")",
  "encore-settings@@encore-disable-grain": true,
  "encore-settings@@encore-fancy-headers": true,
  "encore-settings@@encore-custom-bold@@dark": "#F9C515",
  "encore-settings@@theme-light": "encore-theme-light",
  "encore-settings@@encore-custom-italic@@dark": "#20D4D6",
  "encore-settings@@encore-custom-h1@@dark": "#FC7214",
  "encore-settings@@encore-custom-h2@@dark": "#C51687",
  "encore-settings@@encore-custom-h3@@dark": "#6B22C5",
  "encore-settings@@encore-coloured-tooltip": true,
  "encore-settings@@encore-translucency-strength": 0.25
}'';
        }
      ];

      corePlugins = [
          "backlink"
          "bases"
          "bookmarks"
          "canvas"
          "command-palette"
          "file-recovery"
          "files"
          "graph"
          "markdown-importer"
          "note-composer"
          "outgoing-link"
          "outline"
          "page-preview"
          "properties"
          "switcher"
          "tag-pane"
          "webviewer"
          "word-count"
        ];
    };
};
}
