{simpleBind, pvarBind}:let
	ipc = "noctalia msg ";
	terminal = "kitty";
	shell = "fish";
	fileManager = "${terminal} -- ${shell} -C y";
	browser = "zen-twilight";
	editor = "${terminal} -- ${shell} -C nvimFindBase";
in [
(simpleBind "SUPER + T" "${terminal}")
(simpleBind "SUPER+SHIFT + T" "kitten quick-access-terminal")
(simpleBind "SUPER + E" "${fileManager}")
(simpleBind "SUPER + W" "${browser}")
(simpleBind "SUPER+SHIFT + V" "${editor}")
(simpleBind "SUPER + O" "app2unit -- obsidian")
#(simpleBind "SUPER + G" "app2unit -- github-desktop")
(simpleBind "SUPER+SHIFT + P" "hyprpicker -a")

# SCREEN CAPTURE
(simpleBind "SUPER + R" "fish -c screenrec-toggle")
(simpleBind "SUPER + S" "fish -c screencap-region")
(simpleBind "SUPER+SHIFT + S" "fish -c screencap-window")
(simpleBind "Print" "fish -c screencap-screen")
]
