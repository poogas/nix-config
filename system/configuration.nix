{ config, pkgs, inputs, hostname, username, stateVersion, ... }:

{
  imports = [
    ./overlays
    ./core
    ./hardware
    ./desktop
  ];

  nixpkgs.config.allowUnfree = true;

  hardware.enableRedistributableFirmware = true;

  system.stateVersion = stateVersion;
}
