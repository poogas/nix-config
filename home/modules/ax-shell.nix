{ pkgs, inputs, config, ... }:

{
  imports = [
    inputs.ax-shell.homeManagerModules.default
  ];

  programs.ax-shell = {
    # --- ГЛАВНЫЙ ПЕРЕКЛЮЧАТЕЛЬ ---
    enable = true;

    matugen.extraSettings = {
      config.wallpaper = {
        # arguments = [ "img" "-t" "fade" "--transition-duration" "1.2" "--transition-step" "255" "--transition-fps" "165" "-f" "Lanczos3" ];
        # arguments = [ "img" "-t" "wipe" "--transition-duration" "0.5" "--transition-angle" "45" "--transition-fps" "165" "-f" "Lanczos3" ];
        arguments = [ "img" "-t" "grow" "--transition-duration" "1.2" "--transition-pos" "center" "--transition-fps" "165" "-f" "Lanczos3" ];
        # arguments = [ "img" "-t" "wave" "--transition-duration" "1.5" "--transition-angle" "0" "--transition-fps" "165" "-f" "Lanczos3" ];
        # arguments = [ "img" "-t" "wipe" "--transition-duration" "0.8" "--transition-angle" "90" "--transition-fps" "165" "-f" "Lanczos3" ];
        # arguments = [ "img" "-t" "outer" "--transition-duration" "2.0" "--transition-step" "100" "--transition-fps" "165" "-f" "Lanczos3" ];
      };
      templates = {
        "alacritty" = {
          input_path = "${inputs.matugen-themes}/templates/alacritty.toml";
          output_path = "${config.xdg.configHome}/alacritty/matugen_colors.toml";
        };
        # "gtk3" = {
        #   input_path = "${inputs.matugen-themes}/templates/gtk-colors.css";
        #   output_path = "${config.xdg.configHome}/gtk-3.0/gtk.css";
        # };
        # "gtk4" = {
        #   input_path = "${inputs.matugen-themes}/templates/gtk-colors.css";
        #   output_path = "${config.xdg.configHome}/gtk-4.0/gtk.css";
        # };
      };
    };

    # # --- НАСТРОЙКИ ВЕРХНЕГО УРОВНЯ ---
    # autostart = {
    #   enable = true; # Автоматически запускать Ax-Shell вместе с Hyprland
    #   logPath = "/home/qwerty/.local/state/ax-shell/main.log"; # Путь к лог-файлу
    # };

    # --- ГЛАВНЫЙ БЛОК НАСТРОЕК (settings) ---
    # Все, что находится здесь, передается в JSON-конфиг для самого приложения.
    settings = {

      # --- Общие настройки ---
      terminalCommand = "alacritty -e"; # Какой терминал использовать для tmux
      datetime12hFormat = false;   # Использовать 12-часовой формат времени (true/false)
      cornersVisible = true;       # Показывать декоративные закругленные углы по краям экрана

      cursor = {
        theme = "Bibata-Modern-Ice"; # Название темы
        size = 30;                     # Размер
        package = pkgs.oreo-cursors-plus; # Пакет, предоставляющий тему
      };

      # # --- Обои и иконка профиля ---
      # wallpapersDir = "/home/qwerty/Pictures/Wallpapers"; # Путь к вашей папке с обоями
      # defaultWallpaper = /home/qwerty/Pictures/Wallpapers/default.jpg; # Путь к обоям по умолчанию
      # defaultFaceIcon = /home/qwerty/Pictures/avatar.png; # ПУТЬ К ВАШЕЙ ЛИЧНОЙ ИКОНКЕ

      dashboard.components = {
        widgets = true;    # Показать виджеты
        pins = false;      # Показать закрепленные приложения
        kanban = true;    # Скрыть канбан-доску
        wallpapers = true; # Показать управление обоями
        mixer = true;     # Скрыть микшер
      };

      # --- Настройки Бара (верхней панели) ---
      bar = {
        position = "Top"; # "Top", "Bottom", "Left", "Right"
        centered = false; # Центрировать виджеты на баре (true/false)
        theme = "Pills";  # "Pills", "Dense", "Edge"
        
        workspace = {
          showNumber = false;         # Показывать номера рабочих столов (true/false)
          useChineseNumerals = false; # Использовать китайские цифры (true/false)
          hideSpecial = true;         # Скрывать "специальные" рабочие столы (например, scratchpad)
        };

        metrics = {
          disks = [ "/" ]; # Список дисков для отображения в виджете
        };

        # Включение/отключение виджетов на баре
        components = {
          button_apps = true;
          systray = true;
          control = true;
          network = true;
          button_tools = true;
          sysprofiles = true;
          button_overview = false;
          ws_container = true;
          battery = true;
          metrics = false;
          language = true;
          date_time = true;
          button_power = true;
        };
      };

      # --- Настройки Дока (нижней панели с иконками) ---
      dock = {
        enable = false;          # Включить док (true/false)
        alwaysOccluded = false; # Держать док всегда под окнами (true/false)
        iconSize = 28;         # Размер иконок в пикселях
        theme = "Pills";       # "Pills", "Dense", "Edge"
      };

      # --- Настройки Панелей (Dashboard, Лаунчер и т.д.) ---
      panel = {
        theme = "Notch";  # "Notch" (по центру сверху), "Panel" (сбоку)
        position = "Center"; # Позиция для темы "Panel": "Start", "Center", "End"
      };

      # --- Настройки Уведомлений ---
      notifications = {
        position = "Bottom"; # "Top", "Bottom"
        limitedAppsHistory = [ "Spotify" "Clementine" ]; # Приложения с ограниченной историей
        historyIgnoredApps = [ "Hyprshot" "flameshot" ]; # Игнорируемые приложения
      };

      # --- Настройки виджетов системных метрик ---
      metrics = {
        # Какие метрики показывать в большом виде (на Dashboard)
        main = {
          cpu = true;
          ram = true;
          disk = true;
          gpu = true;
        };
        # Какие метрики показывать в маленьком виде (на баре)
        small = {
          cpu = true;
          ram = true;
          disk = true;
          gpu = true;
        };
      };

      # --- Настройки Горячих Клавиш ---
      keybindings = {
        restart = { prefix = "SUPER ALT"; suffix = "B"; };
        axmsg = { prefix = "SUPER"; suffix = "A"; };
        dash = { prefix = "SUPER"; suffix = "D"; };
        bluetooth = { prefix = "SUPER"; suffix = "B"; };
        pins = { prefix = "SUPER"; suffix = "Q"; };
        kanban = { prefix = "SUPER"; suffix = "N"; };
        launcher = { prefix = "SUPER"; suffix = "R"; };
        tmux = { prefix = "SUPER"; suffix = "T"; };
        cliphist = { prefix = "SUPER"; suffix = "V"; };
        toolbox = { prefix = "SUPER"; suffix = "S"; };
        overview = { prefix = "SUPER"; suffix = "TAB"; };
        wallpapers = { prefix = "SUPER"; suffix = "COMMA"; };
        randwall = { prefix = "SUPER SHIFT"; suffix = "COMMA"; };
        mixer = { prefix = "SUPER"; suffix = "M"; };
        emoji = { prefix = "SUPER"; suffix = "PERIOD"; };
        power = { prefix = "SUPER"; suffix = "ESCAPE"; };
        caffeine = { prefix = "SUPER SHIFT"; suffix = "M"; };
        restart_inspector = { prefix = "SUPER CTRL ALT"; suffix = "B"; };
      };
    };
  };
}
