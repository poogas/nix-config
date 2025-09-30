{ pkgs, ... }:

{
  gtk = {
    enable = true;

    # theme = {
    #   package = pkgs.gnome-themes-extra;
    #   name = "Adwaita-dark";
    # };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
