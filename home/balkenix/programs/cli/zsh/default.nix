_: {
  imports = [
    ./plugins.nix
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = true;
    historySubstringSearch.enable = true;
    initExtra = ''
      ${builtins.readFile scripts/init.zsh};
      ${builtins.readFile scripts/function.zsh};
    '';
  };
}
