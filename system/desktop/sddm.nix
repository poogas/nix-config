{ ... }:

{
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "qwerty";

    defaultSession = "hyprland-uwsm";
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };
}
