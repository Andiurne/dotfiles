{...}: {
nixpkgs.overlays = [
          (self: super:
let
  #inherit (super) lib;
  version = "1.3.315";
in
{
  ryubing = super.appimageTools.wrapType2 {
    pname = "Ryubinx";
    version = version;
    src = super.fetchurl {
      url = "https://git.ryujinx.app/Ryubing/Canary/releases/download/${version}/ryujinx-canary-${version}-x64.AppImage";
      hash = "sha256-lI39wkecI5h9j/C9nwWXqixjUOAkB1HNiWrO3dfHBrc=";
    };
    extraPkgs = pkgs: [ pkgs.icu ];
  };
})
];}
