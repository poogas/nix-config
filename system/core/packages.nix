{ pkgs, ... }:

{
  # Включаем системные сервисы и приложения
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Пакеты, необходимые для базовой системы и графической среды
  environment.systemPackages = with pkgs; [
    webp-pixbuf-loader    # Позволяет GTK-приложениям видеть .webp изображения
  ];
}
