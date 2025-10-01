{ pkgs, ... }:

{
  gtk = {
    enable = true;

    colorScheme = "dark";

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
