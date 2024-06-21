{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    plugins = with pkgs; [
      tmuxPlugins.cpu
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = "set -g @resurrect-strategy-nvim 'session'";
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-save-interval '60' # minutes

          set -g allow-passthrough on

          set -ga update-environment TERM
          set -ga update-environment TERM_PROGRAM
        '';
      }
    ];
  };
  stylix.targets.tmux.enable = true;
}
