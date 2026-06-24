{pkgs, inputs, ...}:
# Copied from the NixOS wiki
let
	extension = shortId: guid: {
		name = guid;
		value = {
			install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
			installation_mode = "normal_installed";
		};
	};

	extensions = [
		# Find more on addons.mozilla.org, get the short ID from the url
		# like "...addon/SHORT_ID/..."
		# Then go to https://addons.mozzila.org/api/v5/addons/addon/SHORT_ID/
		# To get the guid
		(extension "ublock-origin" "uBlock0@raymondhill.net")
	];
in
{
imports = [
  inputs.zen-browser.homeModules.beta
];
programs.zen-browser = {
  enable = true;
  nativeMessagingHosts = [pkgs.firefoxpwa];

  profiles.default.search = {
	  force = true;
	  default = "ddg";
  };

  # Where extensions and preferences are modified
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
