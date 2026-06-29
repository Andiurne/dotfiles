{
...
}:
{nixpkgs.overlays = [ (final: prev: {
Ryubinx = prev.appimageTools.wrapType2
rec {
    pname = "Ryubinx";
    version = "1.3.315";
    src = prev.fetchurl {
      url = "https://git.ryujinx.app/Ryubing/Canary/releases/download/${version}/ryujinx-canary-${version}-x64.AppImage";
      hash = "sha256-lI39wkecI5h9j/C9nwWXqixjUOAkB1HNiWrO3dfHBrc=";
    };

    appImageContents = prev.appimageTools.extractType1 {inherit pname version src; };

    extraInstallCommands = ''
      mkdir -p $out/share/applications
      mkdir -p $out/share/icons/hicolor/256x256/apps
      cp ${appImageContents}/app.ryujinx.Ryujinx.desktop $out/share/applications/${pname}.desktop
      cp ${appImageContents}/app.ryujinx.Ryujinx.png $out/share/icons/hicolor/256x256/apps/app.ryujinx.Ryujinx.png
    '';

    extraPkgs = pkgs: [ pkgs.icu ];
  };})];}
