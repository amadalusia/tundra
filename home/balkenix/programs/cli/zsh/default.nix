_: {
  imports = [
    ./plugins.nix
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
  };
}
