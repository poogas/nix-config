{ config, pkgs, inputs, ... }:
let
  ax-shell = pkgs.fetchFromGitHub {
    owner = "poogas";
    repo = "ax-shell";
    rev = "c845ae6add5b652f77f03612f329c8a3445b27ae";
    hash = "";
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
