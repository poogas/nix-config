# /etc/nixos/system/desktop/sddm.nix
{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Запускаем SDDM под Wayland
  };
}
