{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fabric-cli = {
      url = "github:poogas/fabric-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nur, home-manager, fabric-cli, ... }@inputs:
    let
      nix-hosts = {
        "qwerty" = {
          username = "qwerty";
          system = "x86_64-linux";
          stateVersion = "25.05";
        };
      };

      makeSystem = hostname: config:
        nixpkgs.lib.nixosSystem {
          system = config.system;
          specialArgs = { inherit inputs hostname; } // config;

          modules = [
            ./system/configuration.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";

              home-manager.extraSpecialArgs = { inherit inputs hostname; } // config;

              home-manager.users."${config.username}" = {
                imports = [ ./home/home.nix ];
              };
            }

	    nur.modules.nixos.default
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs makeSystem nix-hosts;
    };
}
