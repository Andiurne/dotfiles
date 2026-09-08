{inputs,...}:
{nixpkgs.overlays = [
(final: prev: {
  ani-cli = prev.ani-cli.overrideAttrs (old: {
    src = inputs.ani-cli-src;
    #runtimeInputs = old.runtimeInputs ++ [ final.botan3 ];
  });
})
];
}
