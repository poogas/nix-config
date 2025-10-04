{ pkgs, ... }:

{
  programs.helix = {
    enable = true;

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
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        lsp = {
          display-messages = true;
        };
        indent-guides = {
          render = true;
          character = "│";
        };
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        statusline = {
          left = [
            "mode"
            "spinner"
          ];
          center = [ "file-name" ];
          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
        };
      };
    };
    languages.language = [
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
          "ruff"
        ];
        formatter = {
          command = "${pkgs.ruff}/bin/ruff";
          args = [
            "format"
            "--stdin-filename"
            "%%"
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
}
