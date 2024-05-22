{
  description = "tundra - a nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-parts.url = "github:hercules-ci/flake-parts";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
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

  outputs = inputs @ {
    flake-parts,
    nixpkgs,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        nixosConfigurations = {
          snoland = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = {inherit inputs outputs;};
            modules = [
              ./hosts/snoland/configuration.nix
            ];
          };
        };
        overlays.default = final: prev: {
          kanagawa-gtk-theme = final.callPackage ./pkgs/kanagawa-gtk-theme.nix {};
        };
      };

      perSystem = {
        pkgs,
        system,
        self',
        ...
      }: {
        _module.args.pkgs = import nixpkgs {
          inherit system;
          overlays = [inputs.emacs-overlay.overlays.default];
        };
        formatter = pkgs.alejandra;
      };

      systems = [
        "x86_64-linux"
      ];
    };
}
