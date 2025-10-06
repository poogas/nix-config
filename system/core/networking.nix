{
  inputs,
  hostname,
  ...
}:

{
  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  networking.hostFiles = [
    "${inputs.zapret-hosts}/hosts/hosts"
  ];
}
