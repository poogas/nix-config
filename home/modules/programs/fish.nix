# home/modules/fish.nix

{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    functions = {
      hx = {
        body = ''
          command hx $argv
          printf '\033[0 q'
        '';
      };
    };

    shellInit = ''
      # --- Основные цвета терминала ---
      set -g fish_color_normal '#F1DEDD'              # Стандартный текст (on_surface)
      set -g fish_color_command '#FFB3AD'             # Команды, которые ты вводишь (primary)
      set -g fish_color_quote '#E7BDB9'                # Текст в кавычках (secondary)
      set -g fish_color_error '#FFB4AB'                # Ошибки синтаксиса (error)
      set -g fish_color_param '#D8C2BF'                # Параметры команд (on_surface_variant)
      set -g fish_color_comment '#A08C8A'              # Комментарии (начинаются с #) (outline)
      set -g fish_color_operator '#E1C28C'             # Операторы, как | и & (tertiary)
      set -g fish_color_escape '#FCB0D5'               # Экранированные символы, как \n (magenta)
      set -g fish_color_autosuggestion '#D8C2BF'       # Бледный текст автодополнения (on_surface_variant)
      set -g fish_color_cancel '#FFB4AB'               # Символ ^C при отмене команды (error)

      # --- Выделение и поиск ---
      set -g fish_color_search_match --background='#271D1C' # Подсветка при поиске по истории (surface_container)
      set -g fish_color_selection white --bold --background='#534342' # Выделенный текст (Vi-режим) (surface_variant)

      # --- Путь в командной строке ---
      set -g fish_color_cwd '#CEBDFE'                   # Цвет текущей директории (blue)
      set -g fish_color_cwd_root '#FFB4AA'             # Цвет пути, когда ты под рутом (red)
      set -g fish_color_valid_path --underline         # Подчеркивание для существующих путей

      # --- Перенаправления ---
      set -g fish_color_redirection '#E1C28C'          # Символы перенаправления, как > и < (tertiary)

      # --- Цвета для меню автодополнения (пейджер) ---
      set -g fish_pager_color_progress '#FFB3AD'       # Индикатор прокрутки (primary)
      set -g fish_pager_color_prefix '#FFB3AD'         # Префикс (например, имя команды) (primary)
      set -g fish_pager_color_completion '#F1DEDD'     # Текст автодополнения (on_surface)
      set -g fish_pager_color_description '#D8C2BF'    # Описание для флагов (on_surface_variant)
      set -g fish_pager_color_background               # Фон пейджера (использует дефолтный)

      # --- Остальные настройки Fish ---
      set -gx fish_greeting # Убрать приветствие
      set -gx EDITOR hx

      # Инициализация Starship
      starship init fish | source
    '';
  };
}
