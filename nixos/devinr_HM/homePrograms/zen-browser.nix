{config, pkgs, inputs, lib, ...}:
# Copied from the NixOS wiki
let
	extension = shortId: guid: {
		name = guid;
		value = {
			install_url = "https://addons.mozilla.org/en-US/firefox/downloads/latest/${shortId}/latest.xpi";
			installation_mode = "normal_installed";
		};
	};

	prefs = {
		# From about:config
		"extensions.autoDisableScopes" = 0;
		"extensions.pocket.enabled" = false;
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
  
  # Where extensions and preferences are modified
  policies = {
      DisableTelemtry = true;
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
  };
};
}
