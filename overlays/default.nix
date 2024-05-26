{inputs, ...}: {
  additions = final: prev: import ../pkgs {pkgs = final;};

  catppuccin-gtk = import ./catppuccin-gtk.nix { inherit (inputs.nixpkgs) lib; };

  modifications = final: prev: {};

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
