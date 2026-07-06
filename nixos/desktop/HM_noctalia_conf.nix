{config, inputs, ...}: let
	foldImports = ini: nameList: builtins.foldl' (prev: new: prev // new) ini (map (name: (import ./noctaliaConf/${name}.nix)) nameList);
in {
imports = [
	inputs.noctalia.homeModules.default
];

programs.noctalia =  {
	enable = true;

	# Settings go here.
	# See https://docs.noctalia.dev/v4/getting-started/nixos/?section=config-with-home-manager#config-with-home-manager
	# Note: to diff this and latest gui-modified, do
	# nix shell nixpkgs#json-diff -c bash -c "json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)"
	# (this might be worth defining in script
	settings = (foldImports {
		general.avatarImage = config.home.homeDirectory + "/.face";
		bar.order = [ "leftMain" ];
		weather.unit = "imperial";
		wallpaper = {
			directory = "~/Pictures/Wallpapers";
			per_monitor_directories = true;
		};
		nightlight.enabled = true;
		notification.scale = 0.5;
		location.auto_locate = true;
	}
	# Imports from noctaliaConf
	[
		"controlCenter"
		"idle"
		"leftBar"
		"lockscreen"
		"plugins"
		"shell"
		"templates"
		"theme"
		"widget"
	]
	);
};
}
