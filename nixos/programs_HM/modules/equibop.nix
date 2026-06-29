{...}:{
programs.equibop = {
  enable = true;

  # AttrSet of (strings concat with "\n" or abs path)
  # Can be enabled by setting programs.equibop.equicord.settings.enabledThemes to ["THEME_NAME.css"]
  equicord.themes = {
  	"XCX" = ../../assets/pyrite.theme.css;
    };


  equicord.settings = {
    autoUpdate = false;
    autoUpdateNotification = false;
    disableMinSize = true;
    notifyAboutUpdates = false;
    enabledThemes = [ "XCX.css" ];
    plugins = {
        FakeNitro = {
            enabled = true;
        };

        MessageLogger = {
            enabled = true;
            ignoreSelf = true;
        };
      };
  };
};
}
