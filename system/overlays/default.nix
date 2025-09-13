{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.ax-shell.overlays.default
    inputs.awakened-poe-trade.overlays.default
  ];
}
