{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Основные утилиты командной строки ---
    unzip
    zip
    xz
    p7zip
    ripgrep
    jq
    yq-go
    eza
    fzf
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    wget
    ueberzugpp
    glow

    # --- Инструменты для разработки и мониторинга ---
    neovim
    nix-output-monitor
    hugo
    glow
    btop
    iftop
    strace
    ltrace
    lsof
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    # --- Сетевые утилиты ---
    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    # --- Приложения с GUI ---
    telegram-desktop
    discord
    loupe

    # --- Разное ---
    cowsay
  ];
}
