{ pkgs, config, ... }:

let
  axShellSettings = config.programs.ax-shell.settings;

  animation_type =
    if builtins.elem axShellSettings.bar.position [ "Left" "Right" ]
    then "slidefadevert"
    else "slidefade";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;

    extraConfig = ''
      source = ${config.xdg.configHome}/ax-shell/config/hypr/colors.conf

      general {
        col.active_border = rgb($primary)
        col.inactive_border = rgb($surface)
        gaps_in = 2
        gaps_out = 4
        border_size = 2
        layout = dwindle
      }
    '';

    settings = {
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
      };
      monitor = ",3440x1440@165.00Hz,auto,auto";
      cursor = {
        no_warps = true;
      };
      decoration = {
        rounding = 14;
        blur = {
          enabled = false;
          size = 1;
          passes = 3;
          new_optimizations = true;
          contrast = 1;
          brightness = 1;
        };
        shadow = {
          enabled = true;
          range = 10;
          render_power = 2;
          color = "rgba(0, 0, 0, 0.25)";
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.4, 0.0, 0.2, 1.0";
        animation = [
          "windows, 1, 2.5, myBezier, popin 80%"
          "border, 1, 2.5, myBezier"
          "fade, 1, 2.5, myBezier"
          "workspaces, 1, 2.5, myBezier, ${animation_type} 20%"
        ];
      };
      misc = {
        disable_hyprland_logo = true;
        force_default_wallpaper = 0;
      };
      layerrule = [
        "noanim, fabric"
      ];
      windowrulev2 = [
        "content game, class:^(steam_app_.*)$"
        "immediate, class:^(steam_app_.*)$"
        "tile, xwayland:1"
        "opacity 0.95 0.90, class:^(Alacritty)$"
        "opacity 1 0.90, class:^(zen-beta)$"
      ];
      "$mainMod" = "SUPER";
      bind = config.programs.ax-shell.hyprlandBinds ++ [
        "$mainMod, return, exec, alacritty"
        "$mainMod, C, killactive,"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
      ];
      exec-once = config.programs.ax-shell.hyprlandExecOnce ++ [
      ];
    };
  };
}
