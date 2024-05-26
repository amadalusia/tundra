{inputs, ...}: {
  additions = final: prev: import ../pkgs {pkgs = final;};

  catppuccin-gtk = final: prev: import ./catppuccin-gtk.nix {pkgs = final;};

  modifications = final: prev: {};

  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
