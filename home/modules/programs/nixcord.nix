{ inputs, ... }:

{
  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.nixcord = {
    enable = true;
    discord = {
      settings = {
        openasar = {
          setup = true;
        };
      };
    };
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
}
