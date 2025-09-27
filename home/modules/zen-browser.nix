{ inputs, pkgs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;

    policies = let
      mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
        installation_mode = "force_installed";
      });
    in {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = mkExtensionSettings {
        "uBlock0@raymondhill.net" = "ublock-origin";
        "{74145f27-f039-47ce-a470-a662b129930a}" = "clearurls";
        "jid1-BoFifL9Vbdl2zQ@jetpack" = "decentraleyes";
      };
    };

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

        #statuspanel {
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
      
      search = {
        force = true;
        default = "google";
        engines = let
           nixSnowflakeIcon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        in {
          "Nix Packages" = {
            urls = [{
              template = "https://search.nixos.org/packages";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = nixSnowflakeIcon;
            definedAliases = ["np"];
          };
          "Nix Options" = {
            urls = [{
              template = "https://search.nixos.org/options";
              params = [
                { name = "channel"; value = "unstable"; }
                { name = "query"; value = "{searchTerms}"; }
              ];
            }];
            icon = nixSnowflakeIcon;
            definedAliases = ["nop"];
          };
          bing.metaData.hidden = "true";
        };
      };
    };
  };
}
