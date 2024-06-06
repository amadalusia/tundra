_: {
  imports = [
    ./plugins.nix
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    historySubstringSearch.enable = true;
    initExtra = ''
      ${builtins.readFile scripts/init.zsh};
      ${builtins.readFile scripts/functions.zsh};
    '';
  };
}
