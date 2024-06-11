{ pkgs, ... }:
{
  programs.zsh = {
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    plugins = [
      {
        name = "agkozak-zsh-prompt";
        src = pkgs.fetchFromGitHub {
          owner = "agkozak";
          repo = "agkozak-zsh-prompt";
          rev = "refs/tags/v3.11.3";
          sha256 = "YBqFA/DK2K1effniwjPSe5VMx9tZGbmxyJp92TiingU=";
        };
      }
      {
        name = "enhancd";
        src = pkgs.fetchFromGitHub {
          owner = "b4b4r07";
          repo = "enhancd";
          rev = "v2.2.1";
          sha256 = "r0RkHdLUlZYnN/VJlXj6a20LRz/oxpuLtKZyl4BMCkc=";
        };
      }
    ];
  };
}
