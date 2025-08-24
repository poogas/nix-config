{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- Утилиты Hyprland / Wayland (перенесены из system) ---
    brightnessctl
    # cava
    cliphist
    # gpu-screen-recorder-gtk
    # hyprpicker
    hyprshot
    # hyprsunset
    hyprlock 
    libnotify 
    wofi
    mako
    grim
    slurp
    # matugen
    # grimblast
    # nvtopPackages.nvidia
    playerctl
    swappy
    swww
    wl-clipboard
    # wlinhibit

    # --- Основные утилиты командной строки ---
    unzip  # <--- ИСПРАВЛЕНО: убран .override
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

    # --- Инструменты для разработки и мониторинга ---
    neovim
    tmux
    # imagemagick
    # tesseract
    nix-output-monitor
    hugo
    glow
    btop
    iotop
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
    firefox
    telegram-desktop

    # --- Разное ---
    cowsay

    pavucontrol
    blueman
  ];
}
