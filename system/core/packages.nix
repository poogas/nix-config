{ pkgs, ... }:

{
  # Включаем системные сервисы и приложения
  programs.firefox.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Пакеты, необходимые для базовой системы и графической среды
  environment.systemPackages = with pkgs; [
    hyprlock              # Блокировщик экрана, критически важен
    libnotify             # Библиотека для отправки уведомлений
    webp-pixbuf-loader    # Позволяет GTK-приложениям видеть .webp изображения
  ];
}
