{
  description = "tundra - a nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    pre-commit-hooks-nix.url = "github:cachix/pre-commit-hooks.nix";
    disko.url = "github:nix-community/disko";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    river-bsp-layout.url = "github:areif-dev/river-bsp-layout";
    norshfetch.url = "github:balkenix/norshfetch";
    nixvim.url = "github:nix-community/nixvim";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  nixConfig = {
    extra-substituters = [ "https://nix-community.cachix.org" ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  outputs =
    inputs@{ flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.pre-commit-hooks-nix.flakeModule
        inputs.treefmt-nix.flakeModule
      ];

      flake =
        { config, ... }:
        {
          nixosConfigurations = {
            snoland = inputs.nixpkgs.lib.nixosSystem {
              specialArgs.inputs = inputs;
              modules = [
                ./hosts/snoland/configuration.nix
                config.nixosModules.nord
              ];
            };
          };

          overlays = import ./overlays { inherit inputs; };
          nixosModules = import ./modules/nixos;
          homeManagerModules = import ./modules/home-manager;
        };

      perSystem =
        {
          pkgs,
          system,
          config,
          ...
        }:
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            overlays = [
              inputs.emacs-overlay.overlays.default
              inputs.norshfetch.overlays.default
            ];
          };

          pre-commit = {
            check.enable = true;
            settings = {
              hooks = {
                nil.enable = true;
                shellcheck.enable = true;
                treefmt = {
                  enable = true;
                  package = config.treefmt.build.wrapper;
                  settings.formatters = [ pkgs.nixfmt-rfc-style ];
                };
              };
            };
          };

          treefmt = {
            programs = {
              shellcheck.enable = true;
              nixfmt-rfc-style = {
                enable = true;
                package = pkgs.nixfmt-rfc-style;
              };
            };
            projectRootFile = ./flake.nix;
          };

          devShells.default = config.pre-commit.devShell;
          formatter = config.treefmt.build.wrapper;
        };

      systems = [ "x86_64-linux" ];
    };
}
