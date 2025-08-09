{ config, pkgs, inputs, hostname, username, stateVersion, ... }:

{
  imports = [
    ./core
    ./hardware
    ./desktop
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = stateVersion;
}
