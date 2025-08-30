{ username, stateVersion, inputs, ... }:

{
  imports = [
    inputs.ax-shell.homeManagerModules.default
    ./modules
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";
  home.stateVersion = stateVersion;
}
