{ username, stateVersion, inputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";

    extraSpecialArgs = { inherit inputs username stateVersion; };

    users."${username}" = {
      imports = [
        inputs.ax-shell.homeManagerModules.default
        ../../home/home.nix
      ];
    };
  };
}
