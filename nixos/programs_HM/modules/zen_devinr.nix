{pkgs, inputs, ...}:
# Copied from the NixOS wiki
let
    extensions = map (idList: {
      name = builtins.elemAt idList 1;
      value = {
	install_url ="https://addons.mozilla.org/en-US/firefox/downloads/latest/${builtins.elemAt idList 0}/latest.xpi";
	installation_mode = "normal_installed";
      };
    })
    [
      [ "ublock-origin" "uBlock0@raymondhill.net" ]
      [ "adblocker-ultimate" "adblockultimate@adblockultimate.net" ]
      [ "better-canvas" "{8927f234-4dd9-48b1-bf76-44a9e153eee0}" ]
      [ "privacy-badger17" "jid1-MnnxcxisBPnSXQ@jetpack" ]
      [ "privacy-possum" "woop-NoopscooPsnSXQ@jetpack"]
      # User agent switcher, theoretically, but it doesn't *seem* to be a problem
    ];
in
{
imports = [
  inputs.zen-browser.homeModules.twilight
];
programs.zen-browser = {
  enable = true;
  nativeMessagingHosts = [pkgs.firefoxpwa];

  profiles.devinr = {
    # Just a massive file imported by converting prefs.js from my Cachy install
	  settings = import ./zen/prefs.nix;
	  mods = import ./zen/mods.nix;

	  search = {
      # Enforces search engines on each rebuild
		  force = true;
		  default = "ddg";
	  };
  };

  # Where extensions and preferences are modified
  # These are "managed by organization"
  policies = {
      DisableTelemetry = true;
      ExtensionSettings = builtins.listToAttrs extensions;

      SearchEngines = {
	        Default = "ddg";
	        Add = [
	              	{
			  Name = "nixpkgs packages";
		          URLTemplate = "https://search.nixos.org/packages?query={searchTerms}";
		          IconURL = "https://wiki.nixos.org/favicon.ico";
		          Alias = "@np";
		        }
		        {
			  Name = "NixOS options";
		          URLTemplate = "https://search.nixos.org/options?query={searchTerms}";
		          IconURL = "https://wiki.nixos.org/favicon.ico";
		          Alias = "@no";
		        }
		        {
			  Name = "MyNixOS search";
		          URLTemplate = "https://mynixos.com/search?q={searchTerms}";
		          Alias = "@mno";
		        }
			{
			  Name = "Noogle";
			  URLTemplate = "https://noogle.dev/q/?term={searchTerms}";
			  Alias = "@ng";
			}
	              ];
      };

      Preferences = {
	      # USE DOUBLE QUOTES
	      "media.videocontrols.picture-in-picture.video-toggle.enabled" = false;
	      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };
  };
};
}
