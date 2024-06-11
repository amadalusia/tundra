_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      add_newline = false;
      c = { };
      character = { };
      directory = { };
      docker_context = { };
      elixir = { };
      elm = { };
      format = "[](color_orange)$os$username[](bg:color_yellow fg:color_orange)$directory[](fg:color_yellow bg:color_aqua)$git_branch$git_status[](fg:color_aqua bg:color_blue)$c$rust$golang$nodejs$php$java$kotlin$haskell$python[](fg:color_blue bg:color_bg3)$docker_context$conda[](fg:color_bg3 bg:color_bg1)$time[ ](fg:color_bg1)$line_break$character";
      git_branch = { };
      git_status = { };
      golang = { };
      gradle = { };
      haskell = { };
      java = { };
      julia = { };
      nim = { };
      nodejs = { };
      os = { };
      palettes = { };
      rust = { };
      scala = { };
      status = { };
      time = { };
      username = { };
    }; # this will be reformatted later
  };
}
