{ pkgs, config, lib, username, ... }:

{
  programs.hyprlock = {
    enable = true;
    settings = {
      # Указываем hyprlock, где брать переменные цветов ($primary, $foreground и т.д.)
      source = "${config.xdg.configHome}/ax-shell/config/hypr/colors.conf";

      # --- Секция BACKGROUND ---
      background = {
        monitor = ""; # Пустая строка означает "на всех мониторах"
        path = "${config.xdg.configHome}/ax-shell/current.wall";
        blur_passes = 3;
        blur_size = 3;
        contrast = 1.0;
        brightness = 0.5;
        vibrancy = 0.0;
        vibrancy_darkness = 0.0;
      };

      # --- Секция GENERAL ---
      general = {
        hide_cursor = true;
      };

      # --- Секция INPUT FIELD ---
      input-field = {
        monitor = "";
        size = "256, 48";
        outline_thickness = 0;
        dots_size = 0.2;
        dots_spacing = 0.5;
        dots_center = true;
        outer_color = "rgba(00000000)";
        inner_color = "rgba(0, 0, 0, 1)";
        font_color = "rgb($foreground)";
        fail_color = "rgb($error)";
        check_color = "rgb($tertiary)";
        capslock_color = "rgb($secondary)";
        fade_on_empty = false;
        font_family = "Iosevka Nerd Font";
        placeholder_text = "...";
        hide_input = false;
        position = "0, -100";
        halign = "center";
        valign = "center";
        shadow_passes = 1;
        shadow_size = 5;
        shadow_boost = 0.5;
      };

      # --- Секция TIME ---
      label = [
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%H:%M:%S\")\"";
          color = "rgb($foreground)";
          font_size = 14;
          font_family = "Iosevka Nerd Font Bold";
          position = "0, -150";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_size = 5;
          shadow_boost = 0.5;
        }
        # --- Секция USER ---
        {
          monitor = "";
          text = username;
          color = "rgb($foreground)";
          font_size = 14;
          font_family = "Iosevka Nerd Font Bold Italic";
          position = "0, -50";
          halign = "center";
          valign = "center";
          shadow_passes = 1;
          shadow_size = 5;
          shadow_boost = 0.5;
        }
      ];

      # --- Секция PICTURE ---
      image = {
        path = "${config.xdg.configHome}/ax-shell/face.icon";
        size = 200;
        position = "0, 75";
        halign = "center";
        valign = "center";
        border_size = 3;
        border_color = "rgb($primary)";
        shadow_passes = 1;
        shadow_size = 5;
        shadow_boost = 0.5;
      };
    };
  };
}
