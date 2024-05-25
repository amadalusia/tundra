_: {
  programs.bat = {
    enable = true;
    catppuccin.enable = true;
    config = {
      map-syntax = [
        "*.jenkinsfile:Groovy"
        "*.props:Java Properties"
      ];
      pager = "less -FR";
    };
  }; 
}
