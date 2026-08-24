uname: {pkgs, ...}:
let romFilenames =
[
  "Tomodachi-Life-LTD.nsp"
  "Fire-Emblem-Three-Houses.nsp"

  "Xenoblade-Chronicles-DE.nsp"
  "Xenoblade-Chronicles-2.nsp"
  "Xenoblade-Chronicles-3.xci"
  "Xenoblade-Chronicles-X-DE.xci"

  "Romancing-Saga-2-Revenge-of-the-Seven.xci"
  "Unicorn-Overlord.nsp"
  "OCTOPATH-TRAVELER-0.xci"
];
romAttrsetList = map (rawname:
  rec {
    filename = rawname;
    pkgName = builtins.replaceStrings [".xci" ".nsp"] ["" ""] filename;
    appName = builtins.replaceStrings ["-" "_"] [" " " "] pkgName;
  }
  ) romFilenames;
in {
  nixpkgs.overlays =
  [
    (final: prev: {
      ryubing = prev.appimageTools.wrapType2
      rec {
        pname = "ryubing";
        version = "1.3.338";
        src = prev.fetchurl {
          url = "https://git.ryujinx.app/Ryubing/Canary/releases/download/${version}/ryujinx-canary-${version}-x64.AppImage";
          hash = "sha256-oI3cW/gvsZ+TukGkrydiSVS3fw61xFO60bLXHjVcT+Y=";
        };

        appImageContents = prev.appimageTools.extract {inherit pname version src; };

        extraInstallCommands = ''
          mkdir -p $out/share/applications
          mkdir -p $out/share/icons/hicolor/256x256/apps
          cp ${appImageContents}/app.ryujinx.Ryujinx.desktop $out/share/applications/ryubing.desktop
          cp ${appImageContents}/app.ryujinx.Ryujinx.png $out/share/icons/hicolor/256x256/apps/app.ryujinx.Ryujinx.png

          sed -i 's/Exec=Ryujinx.sh %f/Exec=ryubing %f/' $out/share/applications/ryubing.desktop
        '';

        extraPkgs = pkgs: [ pkgs.icu ];
      };})

    (final: prev: {
    ryubing-desktops = prev.stdenv.mkDerivation {
      pname = "ryubing-desktops";
      version = "v1.0";
      src = ./romIcons;
      postInstall = ''
        mkdir -p $out/share/icons/hicolor/256x256/apps
        mkdir -p $out/share/applications
      '' + (builtins.foldl' (l: r: l + r) "" (map (rom: ''

        cp ${rom.pkgName}_256.png $out/share/icons/hicolor/256x256/apps/${rom.pkgName}.png
        echo -e "[Desktop Entry]
        Name=${rom.appName}
        Comment=Launch this game in Ryujinx
        Exec=ryubing /home/${uname}/Games/roms/Switch/Games/${rom.filename}
        Icon=${rom.pkgName}
        Terminal=false
        Type=Application
        Categories=Game
        " > $out/share/applications/${rom.pkgName}.desktop

      '') romAttrsetList));
    };})
    ];

  # For each member of "users.users," include each rom icon in their packages
  # Yes this would be a lot simpler with just systemPackages, but ryubing
  # is a userspace package and this makes it more modular
  users.users.${uname}.packages = with pkgs; [ryubing ryubing-desktops];
}
