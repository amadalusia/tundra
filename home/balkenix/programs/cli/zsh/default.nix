{pkgs, ...}@attrs: {
  imports = [
    ./plugins.nix attrs;
  ];
  
  programs.zsh = {
    enable = true;
  };
}
