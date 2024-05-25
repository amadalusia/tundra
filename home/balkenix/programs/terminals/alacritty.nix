_: let
  family = "IosevkaTerm Nerd Font Mono";
in {
  programs.alacritty = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      env = {
        TERM = "xterm-256color";
      };
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        title = "Alacritty";
      };
      font = {
        normal = {
          inherit family;
          style = "Regular";
        };
        bold = {
          inherit family;
          style = "Bold";
        };
        italic = {
          inherit family;
          style = "Italic";
        };
        bold_italic = {
          inherit family;
          style = "Bold Italic";
        };

        size = 13.0;
      };
    };
  };
}
