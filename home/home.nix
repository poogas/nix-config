{
  username,
  stateVersion,
  pkgs,
  ...
}:

let
  cursorPackage = pkgs.oreo-cursors-plus;
  cursorName = "oreo_black_cursors";
  cursorSize = 30;
in
{
  imports = [
    ./modules
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
    package = cursorPackage;
    name = cursorName;
    size = cursorSize;
  };

  home.stateVersion = stateVersion;
}
