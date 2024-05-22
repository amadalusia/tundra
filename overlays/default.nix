{inputs, ...}: {
  additions = final: prev: import ../pkgs {pkgs = final:};

  modifications = final: prev: {};

  unstable-packaes = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
};
