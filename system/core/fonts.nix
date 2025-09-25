{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.iosevka
    nerd-fonts.ubuntu-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
  ];
}
