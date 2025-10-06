{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      nil
      yaml-language-server
      pyright
      ruff
    ];

    settings = {
      theme = "base16_transparent";

      editor = {
        true-color = true;
        color-modes = true;
        idle-timeout = 100;
        scrolloff = 10;
        soft-wrap.enable = true;
        bufferline = "multiple";
        line-number = "relative";
        lsp = {
          display-messages = true;
          display-inlay-hints = false;
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        indent-guides = {
          render = true;
          character = "│";
          skip-levels = 1;
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        statusline = {
          left = [
            "mode"
            "file-modification-indicator"
            "read-only-indicator"
            "spinner"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "file-type"
            "file-line-ending"
            "file-encoding"
          ];
          mode.normal = "N";
          mode.insert = "I";
          mode.select = "S";
        };
      };
    };

    languages = {
      language-server = {
        pyright = {
          config = {
            python = {
              analysis = {
                diagnosticSeverityOverrides = {
                  reportMissingModuleSource = "none";
                };
              };
            };
          };
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
          language-servers = [ "nil" ];
        }
        {
          name = "python";
          auto-format = true;

          language-servers = [
            "pyright"
          ];
          formatter = {
            command = "ruff";
            args = [
              "format"
              "-"
            ];
          };
        }
        {
          name = "yaml";
          auto-format = false;
          language-servers = [ "yaml-language-server" ];
        }
      ];
    };
  };
}
