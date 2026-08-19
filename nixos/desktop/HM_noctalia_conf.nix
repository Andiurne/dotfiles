{config, inputs, ...}: let
	foldImports = ini: nameList: builtins.foldl' (prev: new: prev // new) ini (map (name: (import ./noctaliaConf/${name}.nix)) nameList);
in {
imports = [
	inputs.noctalia.homeModules.default
];

home.file.".config/noctalia/user-templates.toml" =
{
	source = ../assets/user-templates.toml;
};

programs.noctalia =  {
	enable = true;

	# Settings go here.
	# See https://docs.noctalia.dev/v4/getting-started/nixos/?section=config-with-home-manager#config-with-home-manager
	# Note: to diff this and latest gui-modified, do
	# nix shell nixpkgs#json-diff -c bash -c "json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)"
	# (this might be worth defining in script
	settings = (foldImports {
		shell.avatarImage = config.home.homeDirectory + "/face.png";
		bar.order = [ "leftMain" ];
		weather.unit = "imperial";
		wallpaper = {
			directory = "~/Pictures/Wallpapers";
			per_monitor_directories = true;
		};
		nightlight.enabled = true;
		notification.scale = 0.75;
		location.auto_locate = true;
		brightness = {
			enable_ddcutil = true;
			monitor = {
				"DP-3".backend = "ddcutil";
				"eDP-1" = {
					backend = "backlight";
					#backlight_defice = "intel_backlight";
				};
			};
		};
}
	# Imports from noctaliaConf
	[
		"controlCenter"
		"idle"
		"leftBar"
		"lockscreen"
		"plugins"
		"shell"
		"theme"
		"widget"
	]
	);
};
}
