_: let
  family = "IosevkaTerm Nerd Font Mono";
in {
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };
        title = "Alacritty";
      };
      catppuccin.enable = true;
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
