_: {
  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "30";
      anchor = "bottom";
      horizontal = true;
      border-width = 0;
      outline-width = 0;
      prompt-text = " run: ";
      min-input-width = 120;
      num-results = 5;
      result-spacing = 15;
      padding-top = 5;
      padding-bottom = 0;
      padding-left = 10;
      padding-right = 10;
    };
  };

  stylix.targets.tofi.enable = true;
}
