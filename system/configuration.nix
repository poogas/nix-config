{ config, pkgs, inputs, hostname, username, stateVersion, ... }:

{
  imports = [
    ./core
    ./hardware
    ./desktop
  ];

  nixpkgs.config.allowUnfree = true;

  hardware.enableRedistributableFirmware = true;

  system.stateVersion = stateVersion;
}
