# /etc/nixos/system/desktop/sddm.nix
{ ... }:

{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Запускаем SDDM под Wayland
  };

  # Отключаем текстовые консоли, так как их место занимает SDDM
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
