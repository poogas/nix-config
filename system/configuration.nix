{ config, pkgs, inputs, hostname, username, stateVersion, ... }:

{
  imports = [
    ./overlays
    ./core
    ./hardware
    ./desktop
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;

  hardware.enableRedistributableFirmware = true;
  hardware.ddcci.enable = true;

  system.stateVersion = stateVersion;
}
