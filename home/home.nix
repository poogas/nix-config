{ username, stateVersion, inputs, pkgs, ... }:

{
  imports = [
    ./modules
    ./packages.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.oreo-cursors-plus;
    name = "oreo_black_cursors";
    size = 30;
  };

  home.stateVersion = stateVersion;
}
