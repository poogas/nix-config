{ username, ... }:

{
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = username;

    defaultSession = "hyprland-uwsm";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
