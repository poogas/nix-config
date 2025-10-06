{ pkgs, username, ... }:

{
  users.users."${username}" = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "power"
    ];
    shell = pkgs.fish;
  };
}
