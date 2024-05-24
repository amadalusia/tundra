_: {
  imports = [
    ./plugins.nix
    ./aliasex.nix
  ];

  programs.zsh = {
    enable = true;
  };
}
