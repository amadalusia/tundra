{ pkgs, ... }: {
  home.packages = with pkgs; [
    unzip
    rar
    ueberzugpp
  ];

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    catppuccin.enable = true;
    settings = {
      log = {
        enable = false;
      };
      manager = {
        show_hidden = false;
        sort_by = "modified";
        sort_dir_first = true;
        sort_reverse = true;
      };
    };
  };
}
