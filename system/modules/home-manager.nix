{
  username,
  stateVersion,
  inputs,
  ...
}:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs username stateVersion; };

    users."${username}" = {
      imports = [
        ../../home/home.nix
      ];
    };
  };
}
