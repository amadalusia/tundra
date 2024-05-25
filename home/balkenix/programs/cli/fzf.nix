_: {
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
    defaultOptions = [
      "--border"
      "--height=40%"
    ];
  };
}
