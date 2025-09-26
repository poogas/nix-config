{
  xdg.userDirs = {
    enable = true;

    createDirectories = true;

    desktop = "$HOME/Desktop";
    documents = "$HOME/Documents";
    download = "$HOME/Downloads";
    music = "$HOME/Music";
    pictures = "$HOME/Pictures";
    publicShare = "$HOME/Public";
    templates = "$HOME/Templates";
    videos = "$HOME/Videos";
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];

      "x-scheme-handler/http" = [ "zen-beta.desktop" ];
      "x-scheme-handler/https" = [ "zen-beta.desktop" ];
      "x-scheme-handler/about" = [ "zen-beta.desktop" ];
      "x-scheme-handler/unknown" = [ "zen-beta.desktop" ];
      "text/html" = [ "zen-beta.desktop" ];
    };
  };
}
