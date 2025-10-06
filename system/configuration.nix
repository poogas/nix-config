{ stateVersion, ... }:

{
  imports = [
    ./overlays
    ./core
    ./hardware
    ./desktop
  ];

  nixpkgs.config.allowUnfree = true;

  hardware.enableRedistributableFirmware = true;
  hardware.ddcci.enable = true;

  system.stateVersion = stateVersion;
}
