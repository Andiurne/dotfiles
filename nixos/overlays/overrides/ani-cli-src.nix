{inputs,...}:
{nixpkgs.overlays = [
(final: prev: {
  ani-cli = prev.ani-cli.overrideAttrs (oldAttrs: {
    src = inputs.ani-cli-src;
    version = "master";
  });
})
];
}
