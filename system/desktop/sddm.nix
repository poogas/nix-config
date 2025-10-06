{
  inputs,
  config,
  username,
  ...
}:

{
  imports = [
    inputs.sddm-dynamic-theme.nixosModules.default
  ];

  services.sddm-dynamic-theme = {
    enable = true;
    username = username;

    avatar = {
      enable = true;
      sourcePath = config.home-manager.users.${username}.programs.ax-shell.settings.defaultFaceIcon;
    };
  };
}
