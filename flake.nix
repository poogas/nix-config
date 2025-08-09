{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      nix-hosts = {
        "qwerty" = {
          username = "qwerty";
          system = "x86_64-linux";
          stateVersion = "25.05";
        };
      };

      makeSystem = { hostname, config }:
        nixpkgs.lib.nixosSystem {
          system = config.system;
          specialArgs = { inherit inputs; } // config; 

          modules = [
            ./system/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";

              home-manager.extraSpecialArgs = { inherit inputs; } // config;

              home-manager.users."${config.username}" = {
                imports = [ ./home/home.nix ];
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs makeSystem nix-hosts;
    };
}
