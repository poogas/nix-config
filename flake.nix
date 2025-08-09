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
      # --- Карта хостов, как и была ---
      nix-hosts = {
        "qwerty" = {
          username = "qwerty";
          system = "x86_64-linux";
          stateVersion = "25.05";
        };
      };

      # --- ИСПРАВЛЕННАЯ функция-конструктор ---
      # Она принимает имя хоста и его конфигурацию как два отдельных аргумента.
      makeSystem = hostname: config:
        nixpkgs.lib.nixosSystem {
          system = config.system;
          specialArgs = { inherit inputs hostname; } // config; # Передаем hostname и всю конфигурацию хоста

          modules = [
            # Системные модули
            ./system/configuration.nix

            # Модуль Home Manager
            home-manager.nixosModules.home-manager
            {
              # Конфигурация Home Manager для конкретного пользователя
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "hm-backup";

              # Передаем аргументы в модули Home Manager
              home-manager.extraSpecialArgs = { inherit inputs hostname; } // config;

              # Активируем конфигурацию для пользователя
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
