{ config, ... }:
{
  imports = [
    ./plugins.nix
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    autocd = true;
    defaultKeymap = "emacs";
    historySubstringSearch.enable = true;
    profileExtra =
      if config.wayland.windowManager.river.enable then
        ''
          if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
            exec river
          fi
        ''
      else
        "";
    initExtra = ''
      if [ "$TMUX" = "" ]; then tmux; fi

      ${builtins.readFile scripts/init.zsh};
      ${builtins.readFile scripts/functions.zsh};
    '';
  };
}
