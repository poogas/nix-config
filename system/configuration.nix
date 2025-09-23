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

  system.stateVersion = stateVersion;
}
