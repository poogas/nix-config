{ pkgs, inputs, config, ... }:

let
  ax-shell-pkg = inputs.ax-shell.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  home.packages = [ ax-shell-pkg ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "uwsm -- app ax-shell &> ${config.xdg.stateHome}/ax-shell.log & disown"
  ];
}
