{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -gx fish_greeting
      set -gx EDITOR nvim

      starship init fish | source
    '';
  };
}
