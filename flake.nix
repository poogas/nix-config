{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";
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

      makeSystem = hostname: config:
        nixpkgs.lib.nixosSystem {
          system = config.system;
          specialArgs = { inherit inputs hostname; } // config;

          modules = [
            ./system/configuration.nix
	    ./system/modules/home-manager.nix
          ];
        };
    in
    {
      nixosConfigurations = nixpkgs.lib.mapAttrs makeSystem nix-hosts;
    };
}
