{inputs,...}:
{nixpkgs.overlays = [
(final: prev: {
  ani-cli = prev.ani-cli.overrideAttrs (old: {
    src = inputs.ani-cli-src;
    version = "fix";
    runtimeInputs = old.runtimeInputs ++ [ final.botan3 ];
  });
})
];
}
