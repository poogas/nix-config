{ config, pkgs, inputs, hostname, username, stateVersion, ... }:

{
  imports = [
    ./core
    ./hardware
    ./desktop
  ];

  nixpkgs.config.allowUnfree = true;

  drivers.nvidia.enable = true;

  system.stateVersion = stateVersion;
}
