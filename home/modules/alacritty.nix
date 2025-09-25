{ pkgs, config, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      general = {
        import = [
          "${config.xdg.configHome}/alacritty/matugen_colors.toml"
        ];
      };
      colors = {
        primary = {
          background = "#000000"; 
        };
      };
      terminal = {
        shell = {
          program = "${pkgs.fish}/bin/fish";
          args = [ "-l" ];
        };
      };
      env.TERM = "xterm-256color";
      font = {
        normal = {
          family = "UbuntuMono Nerd Font Mono";
          style = "Regular";
        };
        size = 16;
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
	dynamic_padding = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      keyboard = {
        bindings = [
          { key = "V"; mods = "Control"; action = "Paste"; }
        ];
      };
      cursor = {
        style = {
          shape = "Underline";
          blinking = "On";
        };
        vi_mode_style = {
          shape = "Underline";
          blinking = "On";
        };
      };
    };
  };
}
