{ inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    profiles."default" = {
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "zen.welcome-screen.seen" = true;
        "zen.view.window.scheme" = 0;
	"zen.widget.linux.transparency" = true;
      };

      userChrome = ''
        [data-l10n-id="zen-workspaces-change-theme"] {
          display: none !important;
        }
      '';

      spacesForce = true;
      spaces = {
        "qwerty" = {
          id = "4b015470-b146-42c9-a5f9-3758a3fbe2e2";
          position = 1;
          theme = {
            type = "gradient";
            colors = [{
              red = 0;
              green = 0;
              blue = 0;
            }];
            opacity = 0.95;
          };
        };
      };
    };
  };
}
