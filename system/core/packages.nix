{ pkgs, ... }:

{
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    webp-pixbuf-loader
    # byedpi
    # zapret
  ];
}
