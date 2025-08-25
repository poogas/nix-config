{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.ax-shell.overlays.default
  ];
}
