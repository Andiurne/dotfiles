{inputs,...}:
{nixpkgs.overlays = [
(final: prev: {
  ani-cli = prev.ani-cli.overrideAttrs (old: {
    src = inputs.ani-cli-src;
    version = "v4.15";
    runtimeInputs = old.runtimeInputs ++ [ final.botan3 ];
  });
})
];
}
