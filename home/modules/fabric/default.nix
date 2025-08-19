{ config, pkgs, inputs, ... }:
let
  ax-shell = pkgs.fetchFromGitHub {
    owner = "HeyImKyu";
    repo = "ax-shell";
    rev = "9150b78a0a951da9e180b0e42efcc0a6d723a1b3";
    hash = "sha256-ezIkbNpQMcxl2Bc0nsW6FoMJps8dtjFWnFcEfEkmvYk=";
  };
in
{
  home.file."${config.xdg.configHome}/Ax-Shell" = {
    source = ax-shell;
  };

  home.file.".local/share/fonts/tabler-icons.ttf" = {
    source = "${ax-shell}/assets/fonts/tabler-icons/tabler-icons.ttf";
  };

  home.file."${config.xdg.configHome}/matugen/config.toml" = {
    source = ./matugen.toml;
  };

  home.packages = with pkgs; [
    matugen
    cava
    hyprsunset
    wlinhibit
    tesseract
    imagemagick
    inputs.fabric-cli.packages.${pkgs.system}.default
    (nur.repos.HeyImKyu.run-widget.override {
      extraPythonPackages = with python3Packages; [
        ijson
        pillow
        psutil
        requests
        setproctitle
        toml
        watchdog
        thefuzz
        numpy
        chardet
      ];
      extraBuildInputs = [
        inputs.gray.packages.${pkgs.system}.default
        networkmanager
        networkmanager.dev
        playerctl
      ];
    })
  ];
  

  wayland.windowManager.hyprland.settings.layerrule = [
    "noanim, fabric"
  ];
}
