{ config, ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  xdg.mimeApps =
    let
      zenDesktopFile = config.programs.zen-browser.package.meta.desktopFileName;

      browserMimeTypes = [
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/mailto"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "text/html"
      ];

      browserApps = builtins.listToAttrs (
        map (name: {
          inherit name;
          value = [ zenDesktopFile ];
        }) browserMimeTypes
      );

      imageApps = {
        "image/png" = [ "org.gnome.Loupe.desktop" ];
        "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
        "image/gif" = [ "org.gnome.Loupe.desktop" ];
        "image/webp" = [ "org.gnome.Loupe.desktop" ];
        "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];
      };

      allDefaultApps = imageApps // browserApps;

    in
    {
      enable = true;
      defaultApplications = allDefaultApps;
      associations.added = allDefaultApps;
    };
}
