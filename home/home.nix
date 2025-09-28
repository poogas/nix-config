{ username, stateVersion, inputs, pkgs, ... }:

{
  imports = [
    ./programs
    ./packages.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.language = {
    base = "en_US.UTF-8"; 
    messages = "en_US.UTF-8"; 
    time = "ru_RU.UTF-8";
    numeric = "ru_RU.UTF-8";
    monetary = "ru_RU.UTF-8";
    paper = "ru_RU.UTF-8";
    name = "ru_RU.UTF-8";
    address = "ru_RU.UTF-8";
    telephone = "ru_RU.UTF-8";
    measurement = "ru_RU.UTF-8";
    ctype = "ru_RU.UTF-8";
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.oreo-cursors-plus;
    name = "oreo_black_cursors";
    size = 30;
  };

  home.stateVersion = stateVersion;
}
