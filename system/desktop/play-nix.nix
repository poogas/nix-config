{ inputs, ... }:

{
  imports = [
    inputs.play-nix.nixosModules.play
  ];

  play = {
    steam.enable = true;
    gamemode.enable = true;
    ananicy.enable = true;
  };
}
