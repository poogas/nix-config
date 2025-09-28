{ inputs, username, ... }:

{
  imports = [
    inputs.sddm-dynamic-theme.nixosModules.default
  ];

  services.sddm-dynamic-theme = {
    enable = true;
    username = username;
    # sourceWallpaperPath = "/путь/к/другим/обоям"; # Можно переопределить, если нужно
  };
}
