{ inputs, ... }:

{
  nixpkgs.overlays = [
    inputs.ax-shell.overlays.default
    inputs.sddm-dynamic-theme.overlays.default
  ];
}
