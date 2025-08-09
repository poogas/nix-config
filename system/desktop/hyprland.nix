{ config, pkgs, inputs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.sessionVariables = {
    MOZ_ENABLE_WAYLAND = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
  };


  environment.systemPackages = with pkgs; [
    wofi         # Лаунчер приложений
    mako         # Демон уведомлений
    grim         # Создание скриншотов
    slurp        # Выделение области экрана (для grim)
    wl-clipboard # Утилита для буфера обмена в Wayland

    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
