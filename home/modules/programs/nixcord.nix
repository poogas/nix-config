{ inputs, lib, ... }:

let
  discordClientSettings = {
    openasar = {
      setup = true;
    };
  };
in
{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    config.plugins = {
      translate = {
        enable = true;
        showChatBarButton = false;
      };
    };
    extraConfig = {
      plugins = {
        translate = {
          receivedOutput = "ru";
        };
      };
    };
  };
  home.file.".config/discord/settings.json" = {
    text = lib.generators.toJSON { } discordClientSettings;
    force = true;
  };
}
