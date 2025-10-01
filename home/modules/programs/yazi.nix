{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;

    plugins = {
      rich-preview = pkgs.yaziPlugins.rich-preview;
    };

    settings = {
      mgr = {
        show_hidden = true;
      };

      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
	max_width = 600;
        max_height = 900;
      };

      plugin = {
        prepend_previewers = [
          { name = "*.md"; run = "rich-preview"; }
          { name = "*.markdown"; run = "rich-preview"; }
          { name = "*.rst"; run = "rich-preview"; }
          { name = "*.ipynb"; run = "rich-preview"; }
          { name = "*.json"; run = "rich-preview"; }
        ];
      };

      opener = {
        markdown = [
          { run = "glow -p \"$@\""; desc = "View with Glow (pager)"; block = true; }
        ];
        image = [
          { run = "loupe \"$@\""; desc = "View with Loupe"; orphan = true; }
        ];
        edit = [
          { run = "hx \"$@\""; desc = "Edit with Helix"; block = true; }
        ];
      };

      open = {
        rules = [
          # Markdown files
          { name = "*.md"; use = "markdown"; }
          { name = "*.markdown"; use = "markdown"; }
          # Images
          { name = "*.jpg"; use = "image"; }
          { name = "*.jpeg"; use = "image"; }
          { name = "*.png"; use = "image"; }
          { name = "*.gif"; use = "image"; }
          { name = "*.bmp"; use = "image"; }
          { name = "*.svg"; use = "image"; }
          { name = "*.webp"; use = "image"; }
          # Text and code files
          { name = "*.txt"; use = "edit"; }
          { name = "*.py"; use = "edit"; }
          { name = "*.js"; use = "edit"; }
          { name = "*.ts"; use = "edit"; }
          { name = "*.tsx"; use = "edit"; }
          { name = "*.jsx"; use = "edit"; }
          { name = "*.rs"; use = "edit"; }
          { name = "*.go"; use = "edit"; }
          { name = "*.c"; use = "edit"; }
          { name = "*.cpp"; use = "edit"; }
          { name = "*.cc"; use = "edit"; }
          { name = "*.cxx"; use = "edit"; }
          { name = "*.h"; use = "edit"; }
          { name = "*.hpp"; use = "edit"; }
          { name = "*.hxx"; use = "edit"; }
          { name = "*.css"; use = "edit"; }
          { name = "*.scss"; use = "edit"; }
          { name = "*.sass"; use = "edit"; }
          { name = "*.html"; use = "edit"; }
          { name = "*.htm"; use = "edit"; }
          { name = "*.xml"; use = "edit"; }
          { name = "*.yaml"; use = "edit"; }
          { name = "*.yml"; use = "edit"; }
          { name = "*.toml"; use = "edit"; }
          { name = "*.json"; use = "edit"; }
          { name = "*.jsonc"; use = "edit"; }
          { name = "*.json5"; use = "edit"; }
          { name = "*.ini"; use = "edit"; }
          { name = "*.conf"; use = "edit"; }
          { name = "*.cfg"; use = "edit"; }
          { name = "*.nix"; use = "edit"; }
          { name = "*.sh"; use = "edit"; }
          { name = "*.bash"; use = "edit"; }
          { name = "*.zsh"; use = "edit"; }
          { name = "*.fish"; use = "edit"; }
          { name = "*.vim"; use = "edit"; }
          { name = "*.lua"; use = "edit"; }
          { name = "*.rb"; use = "edit"; }
          { name = "*.php"; use = "edit"; }
          { name = "*.java"; use = "edit"; }
          { name = "*.kt"; use = "edit"; }
          { name = "*.swift"; use = "edit"; }
          { name = "*.dart"; use = "edit"; }
          { name = "*.sql"; use = "edit"; }
          { name = "*.dockerfile"; use = "edit"; }
          { name = "Dockerfile*"; use = "edit"; }
          { name = "*.env"; use = "edit"; }
          { name = "*.gitignore"; use = "edit"; }
          { name = "*.gitconfig"; use = "edit"; }
        ];
      };
    };
  };
}
