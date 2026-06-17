{inputs, ...}: {
imports = [
	inputs.noctalia.homeModules.default
];

programs.noctalia = {
	enable = true;

	# Settings go here.
	# See https://docs.noctalia.dev/v4/getting-started/nixos/?section=config-with-home-manager#config-with-home-manager
	# Note: to diff this and latest gui-modified, do
	# nix shell nixpkgs#json-diff -c bash -c "json-diff <(jq -S . ~/.config/noctalia/settings.json) <(noctalia-shell ipc call state all | jq -S .settings)"
	# (this might be worth defining in script
	settings = {

	};
};
}
