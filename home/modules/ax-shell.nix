{ pkgs, ... }:

{
  programs.ax-shell = {
    enable = true;

    settings = {

      # --- Основные ---
      # Путь к директории с обоями.
      # По умолчанию используется директория с примерами из самого пакета Ax-Shell.
      # wallpapersDir = "/path/to/your/wallpapers";

      # Команда для запуска вашего любимого терминала.
      terminalCommand = "kitty -e";
      
      # Использовать 12-часовой формат времени (am/pm).
      datetime12hFormat = false;

      # --- Панель (Bar) ---
      bar = {
        # Позиция на экране: "Top", "Bottom", "Left", "Right".
        position = "Top";

        # Центрировать ли компоненты (работает только при position = "Top" или "Bottom").
        centered = false;

        # Тема оформления панели.
        theme = "Pills";
        
        # Настройки воркспейсов
        workspace = {
          showNumber = false;
          useChineseNumerals = false;
          hideSpecial = true; # Скрывать "специальные" воркспейсы (например, для scratchpad)
        };

        # Настройки виджета системных метрик
        metrics = {
          # Список дисков для мониторинга.
          disks = [ "/" ];
        };

        # Видимость компонентов на панели. Установите `false`, чтобы скрыть компонент.
        components = {
          appsButton = true;      # Кнопка запуска приложений
          systray = true;         # Системный трей
          control = true;         # Центр управления (звук, яркость и т.д.)
          network = true;         # Виджет сети
          toolsButton = true;     # Кнопка с инструментами (скриншот и т.д.)
          systemProfiles = true;  # Профили производительности
          overviewButton = true;  # Кнопка обзора окон
          workspaces = true;      # Список воркспейсов
          weather = true;         # Виджет погоды
          battery = true;         # Виджет батареи
          metrics = true;         # Виджет системных метрик (CPU, RAM)
          language = true;        # Индикатор раскладки клавиатуры
          dateTime = true;        # Дата и время
          powerButton = true;     # Кнопка выключения/перезагрузки
        };
      };

      # --- Док-панель (Dock) ---
      dock = {
        enable = false;
        alwaysOccluded = false; # Должен ли док всегда быть под окнами
        iconSize = 28;
        theme = "Pills";
      };

      # --- Панель управления (Panel) ---
      # Это большая панель, которая появляется по центру экрана
      panel = {
        theme = "Notch";
        position = "Center";
      };
      
      # --- Уведомления (Notifications) ---
      notifications = {
        position = "Bottom"; # "Top" или "Bottom"
      };

      # --- Детальная настройка виджетов метрик ---
      metrics = {
        # Какие метрики показывать в большой панели управления
        main = {
          cpu = true;
          ram = true;
          disk = true;
          gpu = true;
        };
        # Какие метрики показывать в маленьком виджете на основной панели
        small = {
          cpu = true;
          ram = true;
          disk = true;
          gpu = true;
        };
      };
    };
  };
}
