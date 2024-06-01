_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    defaultOptions = [
      "--border"
      "--height=40%"
    ];
  };

  stylix.targets.fzf.enable = true;
}
