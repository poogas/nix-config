{ pkgs, ... }:

{
  programs.helix = {
    enable = true;
    settings = {
      theme = "base16_transparent";
      editor.cursor-shape = {
        normal = "block";
        insert = "bar";
        select = "underline";
      };
      editor.statusline = {
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
        language-servers = [ "pyright" ];
        formatter = {
          command = "${pkgs.ruff}/bin/ruff";
          args = [
            "format"
            "--stdin-filename"
            "%"
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
