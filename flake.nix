{
  description = "tundra - a nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    river-bsp-layout = {
      url = "github:areif-dev/river-bsp-layout";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    norshfetch = {
      url = "github:balkenix/norshfetch";
      inputs.flake-parts.follows = "flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs @ { self
    , flake-parts
    , nixpkgs
    , ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.pre-commit-hooks-nix.flakeModule
      ];
        
      flake = {config, ...}: {
        nixosConfigurations = {
          snoland = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs; };
            modules = [
              ./hosts/snoland/configuration.nix
              config.nixosModules.gruvbox
            ];
          };
        };

        overlays = import ./overlays { inherit inputs; };
        nixosModules = import ./modules/nixos;
      };

      perSystem =
        { pkgs
        , system
        , ...
        }: {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            overlays = [
              inputs.emacs-overlay.overlays.default
              inputs.norshfetch.overlays.default
            ];
          };
          
          pre-commit = {
            check.enable = true;
            settings.hooks = {
              nixpkgs-fmt.enable = true;
              deadnix.enable = true;
              statix.enable = true;
              nil.enable = true;
              shellcheck.enable = true;
            };
          };
        };

      systems = [
        "x86_64-linux"
      ];
    };
}
